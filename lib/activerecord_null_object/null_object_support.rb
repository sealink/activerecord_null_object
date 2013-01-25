require 'active_support/concern'

module ActiveRecordNullObject
  module NullObjectSupport
    extend ActiveSupport::Concern

    included do
      class_eval do
        class << self
          alias_method_chain :belongs_to, :null_object
          alias_method_chain :has_one, :null_object
        end
      end
    end

    module ClassMethods
      
      # Add null object support to the given accessor method.
      def add_null_object_support(name, options = {}) #:nodoc:
        # Determine the class of the association.
        association_class_name = options[:class_name] || name.to_s.classify
        association_class = association_class_name.constantize
        null_class_name = "Null" + association_class_name

        # Determine the null class for this association.
        null_class = options[:null_object].to_s.classify.safe_constantize || null_class_name.safe_constantize

        unless null_class
          # Define the null class as an ancestor of the association class.
          null_class = Object.const_set(null_class_name, Class.new(association_class))
          null_class.class_eval do
            include ::Singleton
            include ::ActiveRecordNullObject::NullObject
          end
        end

        # Modify the "getter" of the relationship to return an
        # instance of the association's null object instead of returning nil.
        class_eval do
          define_method("#{name}_with_null_object".to_sym) do
            send("#{name}_without_null_object".to_sym) || null_class.instance
          end
          alias_method_chain name, :null_object
        end
      end
      
      # Add a :null_object option to belongs_to.
      def belongs_to_with_null_object(name, options = {}) #:nodoc:
        # Call the real belongs_to so that the association gets defined.
        belongs_to_without_null_object(name, options.except(:null_object))

        # Modify the association if need be.
        if options[:null_object]
          add_null_object_support(name, options)
        end
      end

      # Add a :null_object option to has_one.
      def has_one_with_null_object(name, options = {}) #:nodoc:
        # Call the real belongs_to so that the association gets defined.
        has_one_without_null_object(name, options.except(:null_object))

        # Modify the association if need be.
        if options[:null_object]
          add_null_object_support(name, options)
        end
      end

    end
  end
end
require 'active_support/concern'

module ActiveRecordNullObject
  module NullObjectSupport
    extend ActiveSupport::Concern

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
          define_method("#{name}".to_sym) do |*args|
            super(*args) || null_class.instance
          end
        end
      end

      # Add a :null_object option to belongs_to.
      def belongs_to(name, scope = nil, **options)
        # args << options.except(:null_object)
        # Call the real belongs_to so that the association gets defined.
        super(name, scope, **options.except(:null_object))

        # Modify the association if need be.
        if options[:null_object]
          add_null_object_support(name, options)
        end
      end

      # Add a :null_object option to has_one.
      def has_one(name, scope = nil, **options)
        # args = options.except(:null_object)

        # Call the real belongs_to so that the association gets defined.
        super(name, scope, **options.except(:null_object))

        # Modify the association if need be.
        if options[:null_object]
          add_null_object_support(name, options)
        end
      end

    end
  end
end

require 'active_support/concern'

module ActiveRecordNullObject
  module NullObject
    extend ActiveSupport::Concern

    included do
      validate :unsavable
    end

  
    def id 
      nil
    end
  
    def nil?
      true
    end
    
    def empty?
      true
    end

    def unsavable
      errors.add(:base, "is a null object and can't be saved")
    end
  
  end
end
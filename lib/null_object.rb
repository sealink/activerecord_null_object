module ActiveRecordNullObject
  module NullObject
  
    def id 
      nil
    end
  
    def nil?
      true
    end
    
    def empty?
      true
    end
  
    def validate
      errors.add_to_base("is a null object and can't be saved")
    end
  
  end
end
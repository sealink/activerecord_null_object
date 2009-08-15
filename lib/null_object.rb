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
  
    def new_record?
      false
    end
  
    def save
      true
    end
  
    def save!
      true
    end

    def update_attributes(attributes)
      true
    end
  
    def update_attributes!(attributes)
      true
    end
  
  end
end
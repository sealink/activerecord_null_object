require 'active_record'

require 'activerecord_null_object/version'
require 'activerecord_null_object/null_object'
require 'activerecord_null_object/null_object_support'

ActiveSupport.on_load(:active_record) do
  ActiveRecord::Base.send :include, ActiveRecordNullObject::NullObjectSupport
end

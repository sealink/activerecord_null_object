require 'active_record'

require 'activerecord_null_object/null_object'
require 'activerecord_null_object/null_object_support'

ActiveRecord::Base.send :include, ActiveRecordNullObject::NullObjectSupport
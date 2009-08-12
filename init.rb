require 'rubygems'
require 'activerecord'
ActiveRecord::ActiveRecordError   # Workaround for loading bug in AR 2.3.2.
require File.dirname(__FILE__) + '/lib/activerecord_null_object'

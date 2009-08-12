require 'rubygems'
require 'activerecord'
require 'yaml'
require 'spec'
require File.dirname(__FILE__) + '/../init.rb'

# Open ActiveRecord connection
config = YAML::load(File.open(File.dirname(__FILE__) + '/database.yml'))
ActiveRecord::Base.establish_connection(config['test'])
load(File.dirname(__FILE__) + "/schema.rb")

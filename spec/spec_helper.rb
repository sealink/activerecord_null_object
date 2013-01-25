require 'rubygems'
require 'active_record'
require 'yaml'
require 'rspec'
require File.dirname(__FILE__) + '/../lib/activerecord_null_object.rb'

# Establish database connection.
config = YAML::load(File.open(File.dirname(__FILE__) + '/database.yml'))
ActiveRecord::Base.establish_connection(config['test'])
load(File.dirname(__FILE__) + "/schema.rb")

# Fixes 'address'.singularize  # => 'addres'
ActiveSupport::Inflector.inflections do |inflect|
  inflect.singular(/ess$/i, 'ess')
end

class Account < ActiveRecord::Base
end

class Address < ActiveRecord::Base
end

class Profile < ActiveRecord::Base
end

# Define ActiveRecord classes to use while testing.
class Author < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :sessions
  has_one  :profile
  has_one  :account, :null_object => false
  has_one  :address, :null_object => true
end

class Comment < ActiveRecord::Base
  belongs_to :author, :null_object => true
end

class Post < ActiveRecord::Base
  belongs_to :author, :null_object => false
end

class Session < ActiveRecord::Base
  belongs_to :author
end


require 'rubygems'
require 'activerecord'
require 'yaml'
require 'spec'
require File.dirname(__FILE__) + '/../init.rb'

# Establish database connection.
config = YAML::load(File.open(File.dirname(__FILE__) + '/database.yml'))
ActiveRecord::Base.establish_connection(config['test'])
load(File.dirname(__FILE__) + "/schema.rb")

# Define ActiveRecord classes to use while testing.
class Author < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :sessions
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

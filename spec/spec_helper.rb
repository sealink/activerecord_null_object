require 'rubygems'
require 'bundler/setup'
require 'active_record'
require 'yaml'
require 'rspec'
require 'rspec/its'

I18n.enforce_available_locales = true if I18n.respond_to? :enforce_available_locales=

require 'support/coverage_loader'

require 'activerecord_null_object'

# Fixes 'address'.singularize  # => 'addres'
ActiveSupport::Inflector.inflections do |inflect|
  inflect.singular(/ess$/i, 'ess')
end

DB_FILE = 'tmp/test_db'
FileUtils.mkdir_p File.dirname(DB_FILE)
FileUtils.rm_f DB_FILE

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database => DB_FILE

load('spec/schema.rb')

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
  if ::ActiveRecord::VERSION::MAJOR == 4
    has_one :account, -> {order :created_at}, :null_object => false
  else
    has_one :account, :null_object => false
  end
  has_one  :address, :null_object => true
end

class Comment < ActiveRecord::Base
  if ::ActiveRecord::VERSION::MAJOR == 4
    belongs_to :author, -> {order :name}, :null_object => true
  else
    belongs_to :author, :null_object => true
  end
end

class Post < ActiveRecord::Base
  belongs_to :author, :null_object => false
end

class Session < ActiveRecord::Base
  belongs_to :author
end

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
end

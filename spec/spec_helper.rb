require 'rubygems'
require 'bundler/setup'
require 'active_record'
require 'yaml'
require 'rspec'

I18n.enforce_available_locales = true if I18n.respond_to? :enforce_available_locales=

MINIMUM_COVERAGE = 100

if ENV['COVERAGE']
  require 'simplecov'
  require 'coveralls'
  Coveralls.wear!

  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  SimpleCov.start do
    add_filter '/vendor/'
    add_filter '/spec/'
    add_group 'lib', 'lib'
  end
  SimpleCov.at_exit do
    SimpleCov.result.format!
    percent = SimpleCov.result.covered_percent
    unless percent >= MINIMUM_COVERAGE
      puts "Coverage must be above #{MINIMUM_COVERAGE}%. It is #{"%.2f" % percent}%"
      Kernel.exit(1)
    end
  end
end

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

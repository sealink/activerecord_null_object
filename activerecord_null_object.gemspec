# frozen_string_literal: true

require File.expand_path('lib/activerecord_null_object/version', __dir__)

Gem::Specification.new do |spec|
  spec.name          = "activerecord_null_object"
  spec.version       = ActiveRecordNullObject::VERSION
  spec.authors       = ["Scott Woods", "Alessandro Berardi"]
  spec.email         = ["support@travellink.com.au"]
  spec.description   = %q{Implements the Null Object Pattern for nil values in ActiveRecord associations.}
  spec.summary       = %q{Implements the Null Object Pattern for nil values in ActiveRecord associations.}
  spec.homepage      = 'http://github.com/sealink/activerecord_null_object'

  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activesupport", ">= 6.0", "< 8"
  spec.add_runtime_dependency "activerecord", ">= 6.0", "< 7"
  spec.add_development_dependency "bundler", "~> 2"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-its"
  spec.add_development_dependency "coverage-kit"
  spec.add_development_dependency "simplecov-rcov"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'pry-byebug'
end

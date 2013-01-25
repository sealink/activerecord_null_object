# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{activerecord_null_object}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Scott Woods", "Alessandro Berardi"]
  s.date = %q{2009-09-02}
  s.description = %q{}
  s.email = %q{info@westarete.com}
  s.extra_rdoc_files = [
      "README"
  ]
  s.files = %w{
    .gitignore
    MIT-LICENSE
    README
    Rakefile
    VERSION
    activerecord_null_object.gemspec
    lib/activerecord_null_object.rb
    lib/activerecord_null_object/null_object.rb
    lib/activerecord_null_object/null_object_support.rb
    spec/belongs_to_spec.rb
    spec/database.yml
    spec/null_object_spec.rb
    spec/schema.rb
    spec/spec.opts
    spec/spec_helper.rb
  }
  s.has_rdoc = true
  s.homepage = %q{http://github.com/westarete/activerecord_null_object/}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Implements the Null Object Pattern for nil values in ActiveRecord associations.}
  s.test_files = %w{
    spec/belongs_to_spec.rb
    spec/null_object_spec.rb
    spec/schema.rb
    spec/spec_helper.rb
  }

  s.add_runtime_dependency "activesupport", "~> 3.2.11"
  s.add_runtime_dependency "activerecord", "~> 3.2.11"
  s.add_development_dependency 'rspec', '~> 2.12.0'
  s.add_development_dependency 'sqlite3'

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
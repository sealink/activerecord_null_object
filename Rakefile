require 'spec'
require 'spec/rake/spectask'
require 'init'

desc 'Default: run specs.'
task :default => :spec

Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
  t.spec_files = FileList['spec/**/*_spec.rb']
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = %q{activerecord_null_object}
    s.summary = %q{Implements the Null Object Pattern for nil values in ActiveRecord associations.}
    s.email = %q{info@westarete.com}
    s.homepage = %q{http://github.com/westarete/activerecord_null_object/}
    s.description = ""
    s.authors = ["Scott Woods", "Alessandro Berardi"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

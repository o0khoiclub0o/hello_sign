require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new

task :default => :spec
task :test => :spec

task :console do
  require 'irb'
  require 'irb/completion'
  require 'hello_sign' # You know what to do.
  ARGV.clear
  IRB.start
end


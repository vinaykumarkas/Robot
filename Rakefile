require 'rake'
require 'rspec/core/rake_task'

desc 'Executes specs'
task default: [:specs]

RSpec::Core::RakeTask.new(:specs) do |spec|
  spec.pattern = 'spec/robot_spec.rb'
  spec.rspec_opts = ['--backtrace']
end
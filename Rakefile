require 'rspec/core/rake_task'
require './lib/input_interpreter'
require_relative 'app.rb'

RSpec::Core::RakeTask.new :test do |t|
  t.pattern = 'spec/{,/*/**}/*_spec.rb'
end

task default: [:test]

task :run do
  interpreter = InputInterpreter.new
  app = App.new(interpreter)
  app.parse_file('./input/test_input.txt')
  app.create_plateau
  app.create_controller
  app.create_rover_list
  app.run_rovers
end

require_relative '../lib/robot_helpers/robot_simulator.rb'

RSpec.configure do |configure|
  configure.mock_with :rspec do |config|
    config.syntax = [:expect, :should]
  end
end
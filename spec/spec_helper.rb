=begin
SPec helper class.
Here Syntax is configured for :expect and :should for the moscking.
=end

require_relative '../lib/robot_helpers/robot_simulator.rb'

RSpec.configure do |configure|
  configure.mock_with :rspec do |config|
    config.syntax = [:expect, :should]
  end
end
=begin
This is main class for executing Robot Simulator.
This class accpets commands which are provided and executes them using helper classes
Execution: $ruby robot_replica.rb (from the directory of this file)
=end

require_relative 'robot_helpers/robot_simulator'

simulator = Simulator.new
puts "Please command the Robot: "
command = STDIN.gets

while command
  output = simulator.execute(command.to_s.upcase)
  puts output if output
  command = STDIN.gets
end
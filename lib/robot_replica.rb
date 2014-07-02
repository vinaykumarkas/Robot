require_relative 'robot_helpers/robot_simulator'

simulator = Simulator.new
puts "Please command the Robot: "
command = STDIN.gets

while command
  output = simulator.execute(command.to_s.upcase)
  puts output if output
  command = STDIN.gets
end
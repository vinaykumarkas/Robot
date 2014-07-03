=begin
Private class having a method for REPORTing position of Robot.
This class returns a warning message if the Robot is not PLACed.
=end

private

def report
  return 'REPORT command will be ignored till robot PLACEment is performed' unless @table.is_placed?
  position = @table.position
  orientation = @robot.orientation
  "#{position[:x]},#{position[:y]},#{orientation.to_s.upcase}"
end
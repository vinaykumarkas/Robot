=begin
Private class having a method for turing robot LEFT.
This class returns a warning message if the Robot is not PLACed.
=end

private

def left
  return 'LEFT command will be ignored till robot PLACEment is performed' unless @table.is_placed?
  @robot.left
  nil
end
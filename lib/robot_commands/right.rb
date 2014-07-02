=begin
Private class having a method for turing Robot RIGHT.
This class returns a warning message if the Robot is not PLACed.
=end

private

def right
  return 'RIGHT command will be ignored till robot PLACEment is performed' unless @table.is_placed?
  @robot.right
  nil
end
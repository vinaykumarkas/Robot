=begin
Private class having a method for MOVEing Robot.
This class returns a warning message if the Robot is not PLACed.
This class returns a warning message if the Robot is falling off the table
=end

private

def move
  return 'MOVE command will be ignored till robot PLACEment is performed' unless @table.is_placed?
  vector = @robot.vector
  position = @table.position
  if @table.place(position[:x] + vector[:x], position[:y] + vector[:y])
    nil
  else
    'MOVE command ignored because robot may fall off the tabletop'
  end
end
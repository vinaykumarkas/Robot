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
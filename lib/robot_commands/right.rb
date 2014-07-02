private

def right
  return 'RIGHT command will be ignored till robot PLACEment is performed' unless @table.is_placed?
  @robot.right
  nil
end
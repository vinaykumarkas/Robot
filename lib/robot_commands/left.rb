private

def left
  return 'LEFT command will be ignored till robot PLACEment is performed' unless @table.is_placed?
  @robot.left
  nil
end
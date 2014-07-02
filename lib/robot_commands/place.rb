=begin
Private class having a method for PLACEing Robot.
This class returns a warning message if arguments are provided.
=end

private

def place(position)
  message = nil

  begin
    tokens = position.split(/,/)
    x = tokens[0].to_i
    y = tokens[1].to_i
    orientation = tokens[2].downcase.to_sym

    unless @robot.orient(orientation) && @table.place(x, y)
      message = "PLACE command will be ignored till valid arguments are provided"
    end
  rescue
    message = "PLACE command will be ignored till valid arguments are provided"
  end

  message
end
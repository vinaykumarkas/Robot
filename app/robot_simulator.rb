require_relative 'tabletop'
require_relative 'robot'
require_relative 'robot_commands/place'
require_relative 'robot_commands/report'
require_relative 'robot_commands/left'
require_relative 'robot_commands/right'


class Simulator
  def initialize
    @table = Table.new
    @robot = Robot.new
  end

  def execute(command)
    return if command.strip.empty?

    tokens = command.split(/\s+/)
    operation = tokens.first
    arguments = tokens.last

    case operation
    when 'PLACE'
      place(arguments)
    when 'REPORT'
      report
    when 'MOVE'
      #move
    when 'LEFT'
      left
    when 'RIGHT'
      right
    when 'EXIT'
      puts "Exiting the Robot program .... Good Bye !!"
      abort
    else
    "Ignoring invalid command #{operation}."
    end
  end

end
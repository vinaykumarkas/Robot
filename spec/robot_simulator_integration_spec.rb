require 'spec_helper'

describe 'Simulator' do

  before do
    @simulator = Simulator.new
  end

  it 'ignores COMMANDS before PLACEment' do
    [ 'MOVE', 'LEFT', 'RIGHT' ].each { |command| @simulator.execute command }
    expect(@simulator.execute('REPORT')).to eq('REPORT command will be ignored till robot PLACEment is performed')
  end

  it 'ignores COMMANDS provided before PLACEment' do
    [ 'MOVE', 'LEFT', 'RIGHT', 'PLACE 1,1,WEST' ].each { |command| @simulator.execute command }
    expect(@simulator.execute('REPORT')).to eq('1,1,WEST')
  end

  it 'PLACes the robot on tabletop' do
    [ 'PLACE 0,0,NORTH' ].each { |command| @simulator.execute command }
    expect(@simulator.execute('REPORT')).to eq("0,0,NORTH")
  end

  it 'it MOVEs robot on tabletop' do
    [ 'PLACE 0,0,NORTH', 'MOVE' ].each { |command| @simulator.execute command }
    expect(@simulator.execute('REPORT')).to eq("0,1,NORTH")
  end

  it 'it rotates robot RIGHT on tbale top' do
    [ 'PLACE 1,1,NORTH', 'RIGHT' ].each { |command| @simulator.execute command }
    expect(@simulator.execute('REPORT')).to eq('1,1,EAST')
  end

  it 'MOVEs robot and turns LEFT on tabletop' do
    [ 'PLACE 1,2,EAST', 'MOVE', 'MOVE', 'LEFT', 'MOVE' ].each { |command| @simulator.execute command }
    expect(@simulator.execute('REPORT')).to eq('3,3,NORTH')
  end

  it 'ignores PLACE command that may damage to robot by pushing off the tabletop' do
    [ 'PLACE 0,0,NORTH', 'PLACE -1,0,NORTH', 'MOVE' ].each { |command| @simulator.execute command }
    expect(@simulator.execute('REPORT')).to eq('0,1,NORTH')
  end

  it 'ignores PLACE command with invalid orientations and valid co-ordinates' do
    [ 'PLACE 0,0,WOMBLES' ].each { |command| @simulator.execute command }
    expect(@simulator.execute('REPORT')).to eq('REPORT command will be ignored till robot PLACEment is performed')
  end

  it 'ignores MOVE command that may damage to robot by pushing off the tabletop' do
    [ 'PLACE 0,4,NORTH', 'MOVE' ].each { |command| @simulator.execute command }
    expect(@simulator.execute('REPORT')).to eq('0,4,NORTH')
  end

  it 'ignores invalid PLACEment and applies valid PLACEment commands' do
    [ 'PLACE -1,-1,NORTH', 'PLACE 0,0,SOUTH' ].each { |command| @simulator.execute command }
    expect(@simulator.execute('REPORT')).to eq('0,0,SOUTH')
  end

  it 'ignores PLACE command with valid orientations and invalid co-ordinates' do
    [ 'PLACE -1,-1,NORTH' ].each { |command| @simulator.execute command }
    expect(@simulator.execute('REPORT')).to eq('REPORT command will be ignored till robot PLACEment is performed')
  end
end
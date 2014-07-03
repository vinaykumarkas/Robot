=begin
SPec class containing the example input and output given in the specification document
=end

require_relative 'spec_helper'

describe 'Example' do

  before do
    @simulator = Simulator.new
  end

  it 'executes example a' do
    [ 'PLACE 0,0,NORTH','MOVE' ].each { |command| @simulator.execute command }
    expect(@simulator.execute('REPORT')).to eq('0,1,NORTH')
  end

  it 'executes example b' do
    [ 'PLACE 0,0,NORTH','LEFT' ].each { |command| @simulator.execute command }
    expect(@simulator.execute('REPORT')).to eq('0,0,WEST')
  end

  it 'executes example c' do
    [ 'PLACE 1,2,EAST','MOVE','MOVE','LEFT','MOVE' ].each { |command| @simulator.execute command }
    expect(@simulator.execute('REPORT')).to eq("3,3,NORTH")
  end

end
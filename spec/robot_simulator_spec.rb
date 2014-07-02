require 'spec_helper'

describe 'Simulator' do

  before do
    @table = double('table')
    @table.stub(:place)
    Table.stub(:new).and_return(@table)

    @robot = double('robot')
    @robot.stub(:orient)
    Robot.stub(:new).and_return(@robot)

    @simulator = Simulator.new
  end

  describe '#execute' do

    describe 'blank string' do

      it 'ignores COMMANDS without any warning' do
        expect(@simulator.execute('')).to eq(nil)
      end

    end

    describe 'spaces' do

      it 'ignores COMMANDS without any warning' do
        expect(@simulator.execute('    ')).to eq(nil)
      end

    end

    describe 'before the robot PLACEment' do

      before do
        @table.stub(:is_placed?).and_return(false)
      end

      describe 'PLACE' do

        describe 'robot at valid co-ordinates and in a valid facing' do

          it 'places the robot on the tabletop at the specified location and sets the orientation' do
            @robot.should_receive(:orient).with(:north).and_return(:north)
            @table.should_receive(:place).with(0, 0)
            @simulator.execute('PLACE 0,0,NORTH')
          end

        end

        describe 'robot at valid co-ordinates and in an invalid facing' do

          before do
            @robot.should_receive(:orient).with(:wombles).and_return(nil)
          end

          it 'does not place the robot on the tabletop' do
            @table.should_not_receive(:place)
            expect(@simulator.execute('PLACE 0,0,WOMBLES')).to eq('PLACE command will be ignored till valid arguments are provided')
          end

        end

      end

    end

    describe 'after the robot PLACEment' do

      before do
        @table.stub(:is_placed?).and_return(true)
      end

      describe 'PLACE' do

        describe 'robot at valid co-ordinates and in a valid facing' do

          it 'places the robot on the tabletop and at the specified location and sets the orientation' do
            @robot.should_receive(:orient).with(:north).and_return(:north)
            @table.should_receive(:place).with(0, 0)
            @simulator.execute('PLACE 0,0,NORTH')
          end

        end

        describe 'with invalid inputs' do

          it 'provides a warning message to the user and does not place the robot on the tabletop' do
            @table.should_not_receive(:place)
            expect(@simulator.execute('PLACE SOME WOMBLES')).to eq('PLACE command will be ignored till valid arguments are provided')
          end
        end
      end

    end
  end
end
require 'spec_helper'

describe 'Robot' do

  before do
    @robot = Robot.new
  end

  describe 'orient' do

    it 'allows to orient :north' do
     expect(@robot.orient(:north)).not_to eq(nil)
    end

    it 'allows to orient :south' do
      expect(@robot.orient(:south)).not_to eq(nil)
    end

    it 'allows to orient :west' do
      expect(@robot.orient(:west)).not_to eq(nil)
    end

    it 'allows to orient :east' do
      expect(@robot.orient(:east)).not_to eq(nil)
    end

    it 'disallows invalid orient request' do
      expect(@robot.orient(:wombles)).to eq(nil)
    end

  end

  describe 'orientation' do

    it 'is nil initially' do
      expect(@robot.orientation).to eq(nil)
    end

    describe 'after having valid orientation' do

      before do
        @robot.orient(:north)
      end

      it 'will return the orientation' do
        expect(@robot.orientation).to eq(:north)
      end

    end
  end
   
end
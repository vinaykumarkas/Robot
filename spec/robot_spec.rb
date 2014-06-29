=begin
  This is Spec class for Robot. This class contains the 
  test cases for testing the Orient, Orientation, left 
  and right that are specified in Robot class.
=end

require 'spec_helper'

describe 'Robot' do

  before do
    @robot = Robot.new
  end

  describe '#orient' do

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

  describe '#orientation' do

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

  describe '#left' do

    describe 'when facing south' do

      before do
        @robot.orient(:south)
        @robot.left
      end

      it 'should face east' do
        expect(@robot.orientation).to eq(:east)
      end

    end

    describe 'when facing north' do

      before do
        @robot.orient(:north)
        @robot.left
      end

      it 'should face west' do
        expect(@robot.orientation).to eq(:west)
      end

    end

    describe 'when facing east' do

      before do
        @robot.orient(:east)
        @robot.left
      end

      it 'should face north' do
        expect(@robot.orientation).to eq(:north)
      end
    end

    describe 'when facing west' do

      before do
        @robot.orient(:west)
        @robot.left
      end

      it 'should face south' do
        expect(@robot.orientation).to eq(:south)
      end
    end

  end

  describe '#right' do

    describe 'when facing south' do

      before do
        @robot.orient(:south)
        @robot.right
      end

      it 'should face west' do
        expect(@robot.orientation).to eq(:west)
      end

    end

    describe 'when facing north' do

      before do
        @robot.orient(:north)
        @robot.right
      end

      it 'should face east' do
        expect(@robot.orientation).to eq(:east)
      end

    end

    describe 'when facing east' do

      before do
        @robot.orient(:east)
        @robot.right
      end

      it 'should face south' do
        expect(@robot.orientation).to eq(:south)
      end
    end

    describe 'when facing west' do

      before do
        @robot.orient(:west)
        @robot.right
      end

      it 'should face north' do
        expect(@robot.orientation).to eq(:north)
      end
    end
    
  end

end
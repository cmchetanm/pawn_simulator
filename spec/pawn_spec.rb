require 'spec_helper'

describe Pawn do
  let(:chart) { Chart.new }
  let(:pawn) { Pawn.new(chart) }

  context 'checks correct commands' do
    before do
      pawn.perform("PLACE 0,0,NORTH,WHITE")
      pawn.perform("MOVE 1")
      pawn.perform("REPORT")
    end

    it 'should be in correct position' do
      expect(pawn.report).to eq("0,1,NORTH,WHITE")
    end

    it 'should raise error on invalid commands' do
      expect { pawn.perform("PLACE12NORTHWHITE") }.to raise_error(ArgumentError)
      expect { pawn.perform("MOVEEE") }.to raise_error(ArgumentError)
      expect { pawn.perform("RIGHTT") }.to raise_error(ArgumentError)
    end
  end

  context 'checks output and exceptions' do
    it 'returns exceptions' do
      expect { pawn.place(nil, nil, :east, :white) }.to raise_error(TypeError)
      expect { pawn.place(1, 'abc', nil, :white) }.to raise_error(TypeError)
      expect { pawn.place(1, 0, :northeast, :white) }.to raise_error(TypeError)
      expect { pawn.place(1, 0, :north, :blue) }.to raise_error(TypeError)
    end

    it 'with correct params' do
      expect(pawn.place(0, 1, :north, :white)).to eq(true)
      expect(pawn.place(2, 2, :south, :white)).to eq(true)
    end

    it 'with wrong params' do
      expect(pawn.place(6, 9, :west, :white)).to eq(false)
      expect(pawn.place(-1, 5, :east, :white)).to eq(false)
    end
  end

  context 'Check correct moves' do
    before do
      pawn.place(0, 0, :north, :white)
    end

    it 'should return true' do
      expect(pawn.move(1)).to eq(true)
    end

    it 'should have correct positions' do
      pawn.move(1)
      expect(pawn.position[:x]).to eq(0)
      expect(pawn.position[:y]).to eq(1)
    end
  end

  context 'check correct rotation' do
    before do
      pawn.place(0, 0, :north, :white)
    end

    it 'return back to north from left' do
      expect(pawn.rotate_left).to eq(:west)
      expect(pawn.rotate_left).to eq(:south)
      expect(pawn.rotate_left).to eq(:east)
      expect(pawn.rotate_left).to eq(:north)
    end

    it 'return back to north from right' do
      expect(pawn.rotate_right).to eq(:east)
      expect(pawn.rotate_right).to eq(:south)
      expect(pawn.rotate_right).to eq(:west)
      expect(pawn.rotate_right).to eq(:north)
    end
  end

  context 'Pawn report' do
    before do
      pawn.place(5, 5, :east, :white)
    end

    it 'should report correct position and direction' do
      expect(pawn.report).to eq("5,5,EAST,WHITE")
    end
  end
end

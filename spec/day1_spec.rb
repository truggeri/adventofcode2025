# frozen_string_literal: true

require_relative '../lib/day1'

RSpec.describe Day1 do
  let(:sample_input) do
    <<~INPUT
      L68
      L30
      R48
      L5
      R60
      L55
      L1
      L99
      R14
      L82
    INPUT
  end

  describe '.part1' do
    it 'solves the sample input' do
      expect(Day1.part1(sample_input)).to eq(3)
    end
  end

  describe '.part2' do
    it 'solves the sample input' do
      expect(Day1.part2(sample_input)).to eq(6)
    end
  end
end

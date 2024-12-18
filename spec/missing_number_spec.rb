# frozen_string_literal: true

require 'rspec'
require_relative '../lib/missing_number'

describe MissingNumber do
  describe '.find_missing_number' do
    it 'finds the default 1st missing number in the sequence' do
      arr = [4, 3, 6, 2, 1, 7]
      expect(MissingNumber.find_missing_number(arr)).to eq(5)
    end

    it 'finds the 1st missing number in a empty sequence' do
      arr = []
      expect(MissingNumber.find_missing_number(arr)).to eq(1)
    end

    it 'finds the 2nd missing number in the sequence' do
      arr = [4, 3, 6, 2, 1, 7, 9]
      expect(MissingNumber.find_missing_number(arr, nth: 2)).to eq(8)
    end

    it 'finds the 3rd missing number in the sequence' do
      arr = [4, 3, 6, 2, 1, 7, 9]
      expect(MissingNumber.find_missing_number(arr, nth: 3)).to eq(10)
    end

    it 'finds the first missing number in the sequence without first lower element' do
      arr = [4, 3, 6, 2, 7, 9]
      expect(MissingNumber.find_missing_number(arr, nth: 1)).to eq(1)
    end

    it 'finds the first missing number given a complete sequence' do
      arr = [4, 3, 6, 2, 1, 7, 9, 5, 8]
      expect(MissingNumber.find_missing_number(arr, nth: 1)).to eq(10)
    end

    it 'finds the missing number in a large sequence' do
      arr = [1000, 2000, 3000]
      expect(MissingNumber.find_missing_number(arr, nth: 2500)).to eq(2502)
    end

    it 'finds the missing number in a larger sequence' do
      arr = [100_000, 200_000, 300_000]
      expect(MissingNumber.find_missing_number(arr, nth: 250_000)).to eq(250_002)
    end
  end
end

require './blind_75/bit_manipulation.rb'
require 'rspec'

describe "number of 1 bits" do
  it "test case 1" do
    expect(hamming_weight(0b000000000000000000000000000001011)).to eq(3)
    expect(hamming_weight(0b000000000000000000000000010000000)).to eq(1)
    expect(hamming_weight(0b01111111111111111101111111111101)).to eq(29)
    expect(hamming_weight(0b11111111111111111101111111111101)).to eq(30)
  end
end

describe "counting bits" do
  it "test case 1" do
    expect(count_bits(5)).to eq([0,1,1,2,1,2])
    expect(count_bits(2)).to eq([0,1,1])
    expect(count_bits(0)).to eq([0])
    expect(count_bits(1)).to eq([0,1])
    expect(count_bits(3)).to eq([0,1,1,2])
    expect(count_bits(4)).to eq([0,1,1,2,1])
    expect(count_bits(6)).to eq([0,1,1,2,1,2,2])
  end
end
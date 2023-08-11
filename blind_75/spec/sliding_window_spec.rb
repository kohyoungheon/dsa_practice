require './blind_75/sliding_window.rb'
require 'rspec'

describe "best time to buy and sell stock" do
  it "test case 1" do 
    expect(max_profit([7,1,5,3,6,4])).to eq(5)
    expect(max_profit([7,6,4,3,1])).to eq(0)
    expect(max_profit([2,4,1])).to eq(2)
  end
end

describe "longest substring" do
  it "test case 1" do
    expect(length_of_longest_substring("abcabcbb")).to eq(3)
    expect(length_of_longest_substring("bbbbb")).to eq(1)
    expect(length_of_longest_substring("pwwkew")).to eq(3)
    expect(length_of_longest_substring("")).to eq(0)
  end
end

describe "longest repeating character replacement" do
  it "test case 1" do
    expect(character_replacement("ABAB", 2)).to eq(4)
    expect(character_replacement("AABABBA", 1)).to eq(4)
  end
end
require './blind_75/sliding_window.rb'
require 'rspec'

describe "best time to buy and sell stock" do
  it "test case 1" do 
    expect(max_profit([7,1,5,3,6,4])).to eq(5)
    expect(max_profit([7,6,4,3,1])).to eq(0)
    expect(max_profit([2,4,1])).to eq(2)
  end
end
require './blind_75/binary_search.rb'
require 'rspec'

describe "Find minimum in Rotated Sorted Array" do
  it "test case 1" do
     expect(find_min([3,4,5,1,2])).to eq(1)
     expect(find_min([5,6,7,8,9,0,1,2,3,4])).to eq(0)
     expect(find_min([11,13,15,17])).to eq(11)
  end
end

describe "Search in a Rotated Sorted Array" do
  it "test case 1" do
     expect(search([4,5,6,7,0,1,2], 0)).to eq(4)
     expect(search([4,5,6,7,0,1,2], 3)).to eq(-1)
     expect(search([1], 0)).to eq(-1)
  end
end
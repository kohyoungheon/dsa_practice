require './blind_75/two_pointers.rb'
require 'rspec'

describe "is_palindrome" do
  it "test case 1" do
    expect(is_palindrome("A man, a plan, a canal: Panama")).to eq(true)
    expect(is_palindrome("racecar")).to eq(true)
    expect(is_palindrome("racecars")).to eq(false)
    expect(is_palindrome(nil)).to eq(false)
  end
end

describe "two_sum_ii" do
  it "test_case 1" do
    expect(two_sum_ii([2,7,11,15], 9)).to eq([1,2])
    expect(two_sum_ii([2,3,4], 6)).to eq([1,3])
    expect(two_sum_ii([-1,0], -1)).to eq([1,2])
  end
end

describe "three_sums" do
  it "test_case 1" do
    expect(three_sum([-1, 0, 1, 2, -1, -4])).to eq([[-1, -1, 2], [-1, 0, 1]])
    expect(three_sum([0,1,1])).to eq([])
    expect(three_sum([0,0,0])).to eq([[0,0,0]])
  end
end

describe "container with most water" do
  it "test case 1 " do
    expect(max_area([1,8,6,2,5,4,8,3,7])).to eq(49)
    expect(max_area([1,1])).to eq(1)
    expect(max_area([4,3,2,1,4])).to eq(16)
    expect(max_area([1,2,1])).to eq(2)
  end
end
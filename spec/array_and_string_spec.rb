require './array_and_string.rb'
require 'rspec'
#n = length of list, Time: O(n), Space: O(1) because 1 max_value variable
describe "max_value" do
  it "test case 1" do
    expect(max_value([4, 7, 2, 8, 10, 9])).to eq(10)
  end
end

describe "is_prime?" do
  it "test case 1 " do
    expect(is_prime?(2)).to eq(true)
    expect(is_prime?(3)).to eq(true)
    expect(is_prime?(4)).to eq(false)
    expect(is_prime?(5)).to eq(true)
    expect(is_prime?(6)).to eq(false)
    expect(is_prime?(31)).to eq(true)
    expect(is_prime?(2017)).to eq(true)
  end
end

describe "uncompress" do
  it "test case 1 " do
    expect(uncompress("2c3a1t")).to eq('ccaaat')
    expect(uncompress("4s2b")).to eq('ssssbb')
    expect(uncompress("2p1o5p")).to eq('ppoppppp')
  end
end

describe "compress" do
  it "test case 1" do
    expect(compress('ccaaatsss')).to eq('2c3at3s')
    expect(compress('ssssbbz')).to eq('4s2bz')
    expect(compress('ppoppppp')).to eq('2po5p')
    expect(compress('nnneeeeeeeeeeeezz')).to eq('3n12e2z')
  end
end

describe "anagrams?" do
  it "test case 1" do
    expect(anagrams?('restful', 'fluster')).to eq(true)
    expect(anagrams?('cats', 'tocs')).to eq(false)
    expect(anagrams?('monkeyswrite', 'newyorktimes')).to eq(true)
    expect(anagrams?('paper', 'reapa')).to eq(false)
  end
end

describe "most_frequent_char" do
  it "test case 1" do
    expect(most_frequent_char('bookeeper')).to eq('e')
    expect(most_frequent_char('david')).to eq('d')
    expect(most_frequent_char('mississippi')).to eq('i')
    expect(most_frequent_char('eleventennine')).to eq('e')
  end
end

describe "pair_sum" do
  it "test case 1" do
    expect(pair_sum([3, 2, 5, 4, 1], 8)).to eq([0, 2])
    expect(pair_sum([4, 7, 9, 2, 5, 1], 5)).to eq([0, 5])
    expect(pair_sum([4, 7, 9, 2, 5, 1], 3)).to eq([3, 5])
    expect(pair_sum([1, 6, 7, 2], 13)).to eq([1, 2])
    expect(pair_sum([6, 4, 2, 8 ], 12)).to eq([1, 3])
  end
end

describe "pair_product" do
  it "test case 1" do
    expect(pair_product([3, 2, 5, 4, 1], 8)).to eq([1, 3])
    expect(pair_product([4, 7, 9, 2, 5, 1], 35)).to eq([1, 4])
    expect(pair_product([4, 6, 8, 2], 16)).to eq([2, 3])
  end
end

describe "intersection" do
  it "test case 1" do
    expect(intersection([4,2,1,6], [3,6,9,2,10])).to eq([6,2])
    expect(intersection([2,4,6], [4,2])).to eq([4,2])
    expect(intersection([4,2,1], [1,2,4,6])).to eq([1,2,4])
    expect(intersection([0,1,2], [10,11])).to eq([])
  end
end

describe "five_sort" do
  it "test case 1" do
    expect(five_sort([12, 5, 1, 5, 12, 7])).to eq([12, 7, 1, 12, 5, 5])
    expect(five_sort([5, 2, 5, 6, 5, 1, 10, 2, 5, 5])).to eq([2, 2, 10, 6, 1, 5, 5, 5, 5, 5])
    expect(five_sort([5, 1, 2, 5, 5, 3, 2, 5, 1, 5, 5, 5, 4, 5])).to eq([4, 1, 2, 1, 2, 3, 5, 5, 5, 5, 5, 5, 5, 5] )
  end
end
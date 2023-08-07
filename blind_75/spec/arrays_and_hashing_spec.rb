require './blind_75/arrays_and_hashing.rb'
require 'rspec'

describe "contains duplicate" do
  it  "test 1" do
    expect(contains_duplicate([1,2,3,1])).to eq(true)
    expect(contains_duplicate([1,2,3,4])).to eq(false)
    expect(contains_duplicate([1,1,1,3,3,4,3,2,4,2])).to eq(true)
    expect(contains_duplicate([1,2,3,4,5,6,7,8,9,10])).to eq(false)
  end
end

describe "valid anagram?" do
  it "test 1" do
    expect(is_anagram("anagram", "nagaram")).to eq(true)
    expect(is_anagram("rat", "car")).to eq(false)
    expect(is_anagram("a", "ab")).to eq(false)
    expect(is_anagram("ab", "a")).to eq(false)
    expect(is_anagram("aacc", "ccac")).to eq(false)
  end
end

describe "two sum" do
  it "test 1" do
    expect(two_sum([2,7,11,15], 9)).to eq([0,1])
    expect(two_sum([3,2,4], 6)).to eq([1,2])
    expect(two_sum([3,3], 6)).to eq([0,1])
    expect(two_sum([2,5,5,11], 10)).to eq([1,2])
  end
end

describe "group anagrams" do
  it "test 1" do
    expect(group_anagrams(["eat","tea","tan","ate","nat","bat"])).to eq([["eat", "tea", "ate"], ["tan", "nat"], ["bat"]])
    expect(group_anagrams([""])).to eq([[""]])
    expect(group_anagrams(["a"])).to eq([["a"]])
    expect(group_anagrams(["cab","tin","pew","duh","may","ill","buy","bar","max","doc"])).to eq([["cab"], ["tin"], ["pew"], ["duh"], ["may"], ["ill"], ["buy"], ["bar"], ["max"], ["doc"]])
  end
end

describe "top k frequent elements" do
  # Given an integer array nums and an integer k, 
  # return the k most frequent elements. 
  # You may return the answer in any order.
  it "test 1" do
    expect(top_k_frequent([3,3,3,3,3,3,3,2,2,5,5,5,5,5,5,5,5,5,1,1], 2)).to eq([5,3])
    expect(top_k_frequent([1,1,1,2,2,3], 2)).to eq([1,2])
    expect(top_k_frequent([1], 1)).to eq([1])
    expect(top_k_frequent([1,2], 2)).to eq([1,2])
  end
end
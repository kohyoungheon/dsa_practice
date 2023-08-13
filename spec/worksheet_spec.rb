require './worksheet.rb'
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

describe "product of array except self" do
  it "test case 1" do
    expect(product_except_self([1,2,3,4])).to eq([24,12,8,6])
    expect(product_except_self([-1,1,0,-3,3])).to eq([0,0,9,0,0])
  end
end

describe "encode/decode" do
  it "encodes and decodes strings correctly (test case 1)" do
    strings = ["Hello", "world"]
    encoded = encode(strings)
    decoded = decode(encoded)
    expect(decoded).to eq(strings)
  end

  it "encodes and decodes strings correctly (test case 2)" do
    strings = ["Ruby", "is", "awesome!"]
    encoded = encode(strings)
    decoded = decode(encoded)
    expect(decoded).to eq(strings)
  end
end

describe "Longest Consecutive Sequence" do
  it "test case 1" do
    expect(longest_consecutive([100,4,200,1,3,2])).to eq(4)
    expect(longest_consecutive([0,3,7,2,5,8,4,6,0,1])).to eq(9)
    expect(longest_consecutive([0,0])).to eq(1)
  end
end

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
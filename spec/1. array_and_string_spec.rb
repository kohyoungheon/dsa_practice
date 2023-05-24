require './1. array_and_string.rb'
require 'rspec'

describe "array_and_string" do
  it "#uncompress" do
     expect(uncompress("2c3a1t")).to eq('ccaaat')
     expect(uncompress("4s2b")).to eq('ssssbb')
     expect(uncompress("2p1o5p")).to eq('ppoppppp')
     expect(uncompress("3n12e2z")).to eq('nnneeeeeeeeeeeezz')
     expect(uncompress("12y")).to eq('yyyyyyyyyyyy')
  end

  it "#compress" do
    expect(compress('ccaaatsss')).to eq("2c3at3s")
    expect(compress('ssssbbz')).to eq("4s2bz")
    expect(compress('ppoppppp')).to eq("2po5p")
    expect(compress('nnneeeeeeeeeeeezz')).to eq("3n12e2z")
    expect(compress('yyyyyyyyyyyy')).to eq('12y')
  end

  it "#anagrams?" do
    expect(anagrams?('restful', 'fluster')).to eq(true)
    expect(anagrams?('cats', 'tocs')).to eq(false)
    expect(anagrams?('monkeyswrite', 'newyorktimes')).to eq(true)
    expect(anagrams?('paper', 'reapa')).to eq(false)
    expect(anagrams?('elbow', 'below')).to eq(true)
  end

  it "#most_frequent_char" do
    expect(most_frequent_char('bookeeper')).to eq('e')
    expect(most_frequent_char('david')).to eq('d')
    expect(most_frequent_char('abby')).to eq('b')
    expect(most_frequent_char('mississippi')).to eq('i')
    expect(most_frequent_char('potato')).to eq('o')
    expect(most_frequent_char('eleventennine')).to eq('e')
    expect(most_frequent_char('riverbed')).to eq('r')
  end

  it "#pair_sum" do
    expect(pair_sum([3, 2, 5, 4, 1], 8)).to eq([0, 2])
    expect(pair_sum([4, 7, 9, 2, 5, 1], 5)).to eq([0, 5])
    expect(pair_sum([4, 7, 9, 2, 5, 1], 3)).to eq([3, 5])
    expect(pair_sum([1, 6, 7, 2], 13)).to eq([1,2])
  end

  it "#pair_product" do
    expect(pair_product([3, 2, 5, 4, 1], 8)).to eq([1,3])
    expect(pair_product([3, 2, 5, 4, 1], 10)).to eq([1,2])
    expect(pair_product([4, 7, 9, 2, 5, 1], 5)).to eq([4,5])
    expect(pair_product([4, 7, 9, 2, 5, 1], 35)).to eq([1,4])
    expect(pair_product([3, 2, 5, 4, 1], 10)).to eq([1,2])
    expect(pair_product([4, 6, 8, 2], 16)).to eq([2,3])
  end

  it "intersection" do
    a = (0..49999).to_a
    b = (0..49999).to_a
    expect(intersection([4,2,1,6], [3,6,9,2,10])).to eq([6,2])
    expect(intersection([2,4,6], [4,2])).to eq([4,2])
    expect(intersection([4,2,1], [1,2,4,6])).to eq([1,2,4])
    expect(intersection([0,1,2], [10,11])).to eq([])
    expect(intersection(a, b)).to eq((0..49999).to_a)
  end

  xit "#five_sort" do
  expect(five_sort([12, 5, 1, 5, 12, 7])).to eq([12, 7, 1, 12, 5, 5])
  expect(five_sort([5, 2, 5, 6, 5, 1, 10, 2, 5, 5])).to eq([2, 2, 10, 6, 1, 5, 5, 5, 5, 5])
  expect(five_sort([5, 5, 5, 1, 1, 1, 4])).to eq([4, 1, 1, 1, 5, 5, 5])
  expect(five_sort([5, 5, 6, 5, 5, 5, 5])).to eq([6, 5, 5, 5, 5, 5, 5])
  expect(five_sort([5, 1, 2, 5, 5, 3, 2, 5, 1, 5, 5, 5, 4, 5])).to eq([4, 1, 2, 1, 2, 3, 5, 5, 5, 5, 5, 5, 5, 5])
  end

end

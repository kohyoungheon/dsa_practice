require 'rspec'
require 'rbtree'
require './blind_75/heap_priority_queue.rb'


describe '#add_num' do
  it 'correctly adds and balances numbers' do
    median_finder = MedianFinder.new

    median_finder.add_num(1)
    expect(median_finder.find_median).to eq(1.0)

    median_finder.add_num(5)
    expect(median_finder.find_median).to eq(3.0)

    median_finder.add_num(2)
    expect(median_finder.find_median).to eq(2.0)

    median_finder.add_num(10)
    expect(median_finder.find_median).to eq(3.5)
  end
end


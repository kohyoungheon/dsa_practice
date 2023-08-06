require './dynamic_programming.rb'
require 'rspec'

describe "fib" do
  it "test case 1" do
    expect(fib_r(0)).to eq(0)
    expect(fib(1)).to eq(1)
    expect(fib(2)).to eq(1)
    expect(fib(3)).to eq(2)
    expect(fib(4)).to eq(3)
    expect(fib(5)).to eq(5)
    expect(fib(6)).to eq(8)
    expect(fib(7)).to eq(13)
    expect(fib_r(35)).to eq(9227465)
    expect(fib_r(46)).to eq(1836311903)
  end
end
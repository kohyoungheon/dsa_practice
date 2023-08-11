require './blind_75/stack.rb'
require 'rspec'

describe "valid parantheses" do
  it "test case 1" do
    expect(is_valid("()")).to eq(true)
    expect(is_valid("()[]{}")).to eq(true)
    expect(is_valid("(]")).to eq(false)
    expect(is_valid("([)]")).to eq(false)
    expect(is_valid("{[]}")).to eq(true)
    expect(is_valid("]")).to eq(false)
    expect(is_valid("[")).to eq(false)
  end
end
require './linked_list.rb'
require 'rspec'

describe "linked_list_values" do
  it "test case 1" do
    a = Node.new("a")
    b = Node.new("b")
    c = Node.new("c") 
    d = Node.new("d")
    a.next = b
    b.next = c
    c.next = d
    
    expect(linked_list_values(a)).to eq([ 'a', 'b', 'c', 'd' ])
  end
  it "test case 2" do
    x = Node.new("x")
    y = Node.new("y")
    x.next = y
    expect(linked_list_values(x)).to eq([ 'x', 'y' ])
  end
  it "test case 3" do
    q = Node.new("q")
    expect(linked_list_values(q)).to eq([ 'q' ])
  end
  it "test case 4" do
    expect(linked_list_values(nil)).to eq([])
  end
end

describe "sum_list" do
  it "test case 1" do
    a = Node.new(2)
    b = Node.new(8)
    c = Node.new(3)
    d = Node.new(-1)
    e = Node.new(7)

    a.next = b
    b.next = c
    c.next = d
    d.next = e

    expect(sum_list_best_solution(a)).to eq(19)
  end

  it "test case 2" do
    x = Node.new(38)
    y = Node.new(4)
    x.next = y
    expect(sum_list_best_solution(x)).to eq(42)
  end

  it "test case 3" do
    z = Node.new(100)
    expect(sum_list_best_solution(z)).to eq(100)
  end

  it "test case 4" do
    expect(sum_list_best_solution(nil)).to eq(0)
  end
end

describe "linked list find" do
  it "test case 1" do
    a = Node.new("a")
    b = Node.new("b")
    c = Node.new("c")
    d = Node.new("d")
    a.next = b
    b.next = c
    c.next = d
    expect(linked_list_find(a, "c")).to eq(true)
  end

  it "test case 2" do
    a = Node.new("a")
    b = Node.new("b")
    c = Node.new("c")
    d = Node.new("d")
    a.next = b
    b.next = c
    c.next = d
    expect(linked_list_find(a, "d")).to eq(true)
  end

  it "test case 3" do
    node1 = Node.new("jason")
    node2 = Node.new("leneli")
    node1.next = node2
    expect(linked_list_find(node1, "jason")).to eq(true)
  end
end
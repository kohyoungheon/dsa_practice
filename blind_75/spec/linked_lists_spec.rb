require './blind_75/linked_lists.rb'
require 'rspec'

describe "reverse linked list" do
  it "test case 1" do
    a = Node.new("a")
    b = Node.new("b")
    c = Node.new("c")
    d = Node.new("d")
    e = Node.new("e")
    f = Node.new("f")
    
    a.next = b
    b.next = c
    c.next = d
    d.next = e
    e.next = f

    expect(reverse_list(a)).to eq(f)
  end
  it "test case 2" do
    x = Node.new("x")
    y = Node.new("y")

    x.next = y

    expect(reverse_list(x)).to eq(y)
  end
  it "test case 3" do
    p = Node.new("p")
    reverse_list(p) # p
    expect(reverse_list(p)).to eq(p)
  end
end

describe "merge two sorted lists" do
  it "test case 1" do
    a = Node.new("1")
    b = Node.new("2")
    c = Node.new("4")

    d = Node.new("1")
    e = Node.new("3")
    f = Node.new("4")

    a.next = b
    b.next = c

    d.next = e
    e.next = f

    new_list = merge_two_lists(a, d)
    expect(new_list.data).to eq("1")
    expect(new_list.next.data).to eq("1")
    expect(new_list.next.next.data).to eq("2")
    expect(new_list.next.next.next.data).to eq("3")
    expect(new_list.next.next.next.next.data).to eq("4")
    expect(new_list.next.next.next.next.next.data).to eq("4")
  end
end

describe "reorder lists" do
  it "test case 1" do
    a = Node.new('a')
    b = Node.new('b')
    c = Node.new('c')
    d = Node.new('d')


    a.next = b
    b.next = c
    c.next = d

    new_list = reorder_list(a)

    expect(new_list.data).to eq("a")
    expect(new_list.next.data).to eq("d")
    expect(new_list.next.next.data).to eq("b")
    expect(new_list.next.next.next.data).to eq("c")
  end
end

describe "remove nth element from end of list" do
  it "test case 1" do
    a = Node.new('a')
    b = Node.new('b')
    c = Node.new('c')
    d = Node.new('d')
    e = Node.new('e')

    a.next = b
    b.next = c
    c.next = d
    d.next = e

    new_list = remove_nth_from_end(a, 2)
    expect(new_list.data).to eq("a")
    expect(new_list.next.data).to eq("b")
    expect(new_list.next.next.data).to eq("c")
    expect(new_list.next.next.next.data).to eq("e")
  end
end
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

    expect(sum_list(a)).to eq(19)
  end

  it "test case 2" do
    x = Node.new(38)
    y = Node.new(4)
    x.next = y
    expect(sum_list_rec(x)).to eq(42)
  end

  it "test case 3" do
    z = Node.new(100)
    expect(sum_list_rec(z)).to eq(100)
  end

  it "test case 4" do
    expect(sum_list_rec(nil)).to eq(0)
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
    expect(linked_list_find_rec(node1, "jason")).to eq(true)
  end

  it "test case 4" do
    a = Node.new("a")
    b = Node.new("b")
    c = Node.new("c")
    d = Node.new("d")

    a.next = b
    b.next = c
    c.next = d

    expect(linked_list_find_rec(a, "q")).to eq(false)
  end
end

describe "get_node_value" do
  it "test case 1" do
    a = Node.new("a")
    b = Node.new("b")
    c = Node.new("c")
    d = Node.new("d")

    a.next = b
    b.next = c
    c.next = d

    expect(get_node_value_rec(a, 2)).to eq("c")
    expect(get_node_value(a, 3)).to eq("d")
    expect(get_node_value(a, 7)).to eq(nil)
  end

  it "test case 2" do
    node1 = Node.new("banana")
    node2 = Node.new("mango")

    node1.next = node2

    expect(get_node_value_rec(node1, 0)).to eq("banana")
    expect(get_node_value(node1, 1)).to eq("mango")
  end
end

describe "reverse list" do
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

    expect(reverse_list_rec(a)).to eq(f)
  end
  it "test case 2" do
    x = Node.new("x")
    y = Node.new("y")

    x.next = y

    expect(reverse_list_rec(x)).to eq(y)
  end
  it "test case 3" do
    p = Node.new("p")
    reverse_list(p) # p
    expect(reverse_list_rec(p)).to eq(p)
  end
end

describe "zipper lists" do
  it "test case 1" do
    a = Node.new("a")
    b = Node.new("b")
    c = Node.new("c")
    a.next = b
    b.next = c
    # a -> b -> c

    x = Node.new("x")
    y = Node.new("y")
    z = Node.new("z")
    x.next = y
    y.next = z
    # x -> y -> z

    zipper_merged = zipper_lists_rec(a, x)
    expect(zipper_merged.val).to eq("a")
    expect(zipper_merged.next).to eq(x)
    expect(zipper_merged.next.next).to eq(b)
    expect(zipper_merged.next.next.next).to eq(y)
  end
end

describe "merge_lists" do
  it "test case 1" do
    a = Node.new(5)
    b = Node.new(7)
    c = Node.new(10)
    d = Node.new(12)
    e = Node.new(20)
    f = Node.new(28)
    a.next = b
    b.next = c
    c.next = d
    d.next = e
    e.next = f
    #a->b->c->d->e->f
    q = Node.new(6)
    r = Node.new(8)
    s = Node.new(9)
    t = Node.new(25)
    q.next = r
    r.next = s
    s.next = t
    #q->r->s->t
    result = merge_lists_rec(a, q)

    expect(result.val).to eq(5)
    expect(result.next.val).to eq(6)
    expect(result.next.next.val).to eq(7)
    expect(result.next.next.next.val).to eq(8)
    expect(result.next.next.next.next.val).to eq(9)
    expect(result.next.next.next.next.next.val).to eq(10)
    expect(result.next.next.next.next.next.next.val).to eq(12)
    expect(result.next.next.next.next.next.next.next.val).to eq(20)
    expect(result.next.next.next.next.next.next.next.next.val).to eq(25)
    expect(result.next.next.next.next.next.next.next.next.next.val).to eq(28)
  end
end

describe "is_univalue_list" do
  it "test case 1" do
    a = Node.new(7)
    b = Node.new(7)
    c = Node.new(7)

    a.next = b
    b.next = c

    expect(is_univalue_list(a)).to eq(true)
  end
  it "test case 2" do
    a = Node.new(7)
    b = Node.new(7)
    c = Node.new(4)

    a.next = b
    b.next = c

    expect(is_univalue_list_rec(a)).to eq(false)
  end
  it "test case 3" do 
    z = Node.new('z')
    expect(is_univalue_list_rec(z)).to eq(true)
  end
end

describe "longest streak" do
  it "test case 1" do
    a = Node.new(5)
    b = Node.new(5)
    c = Node.new(7)
    d = Node.new(7)
    e = Node.new(7)
    f = Node.new(6)

    a.next = b
    b.next = c
    c.next = d
    d.next = e
    e.next = f

    # 5 -> 5 -> 7 -> 7 -> 7 -> 6
    expect(longest_streak(a)).to eq(3) #3
  end
  it "test case 2" do 
    a = Node.new(5)
    b = Node.new(5)

    a.next = b

    # 5 -> 5
    expect(longest_streak(a)).to eq(2) # 2
  end
end

describe "remove node" do
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

    # a -> b -> c -> d -> e -> f
    x = remove_node_rec(a, "c")
    # a -> b -> d -> e -> f
  end

  it "test case 2" do 
    node1 = Node.new("h")
    node2 = Node.new("i")
    node3 = Node.new("j")
    node4 = Node.new("i")

    node1.next = node2
    node2.next = node3
    node3.next = node4

    # h -> i -> j -> i
    expect(remove_node(node1, "i")).to eq(node1)
    # h -> j -> i
  end
end

describe "insert node" do
  it "test case 1" do
    a = Node.new("a")
    b = Node.new("b")
    c = Node.new("c")
    d = Node.new("d")
    
    a.next = b
    b.next = c
    c.next = d
    
    # a -> b -> c -> d
    
    insert_node_rec(a, 'x', 2)
    # a -> b -> x -> c -> d
    expect(a.next.next.val).to eq('x')
  end

  it "test case 2" do
    a = Node.new("a")
    b = Node.new("b")
    c = Node.new("c")
    d = Node.new("d")

    a.next = b
    b.next = c
    c.next = d

    # a -> b -> c -> d

    insert_node_rec(a, 'm', 4)
    # a -> b -> c -> d -> m
    expect(d.next.val).to eq('m')
  end

  it "test case 3" do
    a = Node.new("a")
    b = Node.new("b")

    a.next = b

    # a -> b
    x = insert_node_rec(a, 'z', 0)
    # z -> a -> b
    expect(x.val).to eq('z')
  end
end

describe "create_linked_list" do
  it "test case 1" do
    list = create_linked_list_rec(["h", "e", "y"])
    expect(list.val).to eq("h")
    expect(list.next.val).to eq("e")
    expect(list.next.next.val).to eq("y")

    expect(create_linked_list_rec([])).to eq(nil)
    expect(create_linked_list_rec(["a"]).val).to eq("a")
  end
end

describe "add lists" do
  it "test case 1" do
    #   621
    # + 354
    # -----
    #   975

    a1 = Node.new(1)
    a2 = Node.new(2)
    a3 = Node.new(6)
    a1.next = a2
    a2.next = a3
    # 1 -> 2 -> 6

    b1 = Node.new(4)
    b2 = Node.new(5)
    b3 = Node.new(3)
    b1.next = b2
    b2.next = b3
    # 4 -> 5 -> 3

    result = add_lists(a1, b1)
    # 5 -> 7 -> 9
    expect(result.val).to eq(5)
    expect(result.next.val).to eq(7)
    expect(result.next.next.val).to eq(9)
  end

  it "test case 2" do 
    #   999
    #  +  6
    #  ----
    #  1005

    a1 = Node.new(9)
    a2 = Node.new(9)
    a3 = Node.new(9)
    a1.next = a2
    a2.next = a3
    # 9 -> 9 -> 9

    b1 = Node.new(6)
    # 6

    result = add_lists(a1, b1)
    # 5 -> 0 -> 0 -> 1
    expect(result.val).to eq(5)
    expect(result.next.val).to eq(0)
    expect(result.next.next.val).to eq(0)
    expect(result.next.next.next.val).to eq(1)
  end
end
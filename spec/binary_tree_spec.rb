require './binary_tree.rb'
require 'rspec'

describe "depth first values" do
  it "test case 1" do
    a = Node.new('a')
    b = Node.new('b')
    c = Node.new('c')
    d = Node.new('d')
    e = Node.new('e')
    f = Node.new('f')

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f
    #      a
    #    /   \
    #   b     c
    #  / \     \
    # d   e     f

    expected_result = ['a', 'b', 'd', 'e', 'c', 'f']
    expect(depth_first_values_rec(a)).to eq(expected_result)
  end

  it "test case 2" do
    a = Node.new('a')
    b = Node.new('b')
    c = Node.new('c')
    d = Node.new('d')
    e = Node.new('e')
    f = Node.new('f')
    g = Node.new('g')
    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f
    e.left = g

    #      a
    #    /   \
    #   b     c
    #  / \     \
    # d   e     f
    #    /
    #   g

    expected_result = ['a', 'b', 'd', 'e', 'g', 'c', 'f']
    expect(depth_first_values_rec(a)).to eq(expected_result)
  end

  it "test case 3" do
    a = Node.new('a')
    b = Node.new('b')
    c = Node.new('c')
    d = Node.new('d')
    e = Node.new('e')
    a.right = b;
    b.left = c;
    c.right = d;
    d.right = e;

    #      a
    #       \
    #        b
    #       /
    #      c
    #       \
    #        d
    #         \
    #          e
    expected_result = ['a', 'b', 'c', 'd', 'e']
    expect(depth_first_values_rec(a)).to eq(expected_result)
  end
end

describe "breadth_first_values" do
  it "test case 1" do
    a = Node.new('a')
    b = Node.new('b')
    c = Node.new('c')
    d = Node.new('d')
    e = Node.new('e')
    f = Node.new('f')

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f

    #      a
    #    /   \
    #   b     c
    #  / \     \
    # d   e     f

    expected_result = ['a', 'b', 'c', 'd', 'e', 'f']
    expect(breadth_first_values(a)).to eq(expected_result)
  end

  it "test case 2" do
    a = Node.new('a')
    b = Node.new('b')
    c = Node.new('c')
    d = Node.new('d')
    e = Node.new('e')
    f = Node.new('f')
    g = Node.new('g')
    h = Node.new('h')

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f
    e.left = g
    f.right = h

    #      a
    #    /   \
    #   b     c
    #  / \     \
    # d   e     f
    #    /       \
    #   g         h

    expected_result = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
    expect(breadth_first_values(a)).to eq(expected_result)
  end

  it "test case 3" do 
    a = Node.new('a')
    b = Node.new('b')
    c = Node.new('c')
    d = Node.new('d')
    e = Node.new('e')
    x = Node.new('x')

    a.right = b
    b.left = c
    c.left = x
    c.right = d
    d.right = e

    #      a
    #       \
    #        b
    #       /
    #      c
    #    /  \
    #   x    d
    #         \
    #          e
    expected_result = ['a', 'b', 'c', 'x', 'd', 'e']
    expect(breadth_first_values(a)).to eq(expected_result)
  end
end

describe "tree_sum" do
  it "test case 1" do
    a = Node.new(3)
    b = Node.new(11)
    c = Node.new(4)
    d = Node.new(4)
    e = Node.new(-2)
    f = Node.new(1)

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f

    #       3
    #    /    \
    #   11     4
    #  / \      \
    # 4   -2     1

    # tree_sum(a)  -> 21
    expect(tree_sum_rec(a)).to eq(21)
  end

  it "test case 2" do
    a = Node.new(1)
    b = Node.new(6)
    c = Node.new(0)
    d = Node.new(3)
    e = Node.new(-6)
    f = Node.new(2)
    g = Node.new(2)
    h = Node.new(2)

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f
    e.left = g
    f.right = h

    #      1
    #    /   \
    #   6     0
    #  / \     \
    # 3   -6    2
    #    /       \
    #   2         2

    # tree_sum(a)  -> 10
    expect(tree_sum_rec(a)).to eq(10)
  end
end

describe "tree_includes" do
  it "test case 1" do
    a = Node.new("a")
    b = Node.new("b")
    c = Node.new("c")
    d = Node.new("d")
    e = Node.new("e")
    f = Node.new("f")

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f

    #      a
    #    /   \
    #   b     c
    #  / \     \
    # d   e     f

    # tree_includes(a, "e") # -> True
    expect(tree_includes(a, "e")).to eq(true)
  end

  it "test case 2" do
    a = Node.new("a")
    b = Node.new("b")
    c = Node.new("c")
    d = Node.new("d")
    e = Node.new("e")
    f = Node.new("f")
    g = Node.new("g")
    h = Node.new("h")

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f
    e.left = g
    f.right = h

    #      a
    #    /   \
    #   b     c
    #  / \     \
    # d   e     f
    #    /       \
    #   g         h

    # tree_includes(a, "p") # -> False
    expect(tree_includes(a, "p")).to eq(false)
  end
end

describe "tree_min_value" do
  it "test case 1" do
    a = Node.new(3)
    b = Node.new(11)
    c = Node.new(4)
    d = Node.new(4)
    e = Node.new(-2)
    f = Node.new(1)

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f

    #       3
    #    /    \
    #   11     4
    #  / \      \
    # 4   -2     1
    # tree_min_value(a) # -> -2
    expect(tree_min_value_rec(a)).to eq(-2)
  end
  it "test case 2" do
    a = Node.new(5)
    b = Node.new(11)
    c = Node.new(3)
    d = Node.new(4)
    e = Node.new(14)
    f = Node.new(12)
    
    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f
    
    #       5
    #    /    \
    #   11     3
    #  / \      \
    # 4   14     12
    
    # tree_min_value(a) # -> 3
    expect(tree_min_value_rec(a)).to eq(3)
  end
end

describe "max_sum_path" do
  it "test case 1" do
    a = Node.new(3)
    b = Node.new(11)
    c = Node.new(4)
    d = Node.new(4)
    e = Node.new(-2)
    f = Node.new(1)

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f

    #       3
    #    /    \
    #   11     4
    #  / \      \
    # 4   -2     1

    # max_path_sum(a) # -> 18
    expect(max_path_sum(a)).to eq(18)
  end

  it "test case 2" do 
    a = Node.new(5)
    b = Node.new(11)
    c = Node.new(54)
    d = Node.new(20)
    e = Node.new(15)
    f = Node.new(1)
    g = Node.new(3)

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    e.left = f
    e.right = g

    #        5
    #     /    \
    #    11    54
    #  /   \      
    # 20   15
    #      / \
    #     1  3

    # max_path_sum(a) # -> 59
    expect(max_path_sum(a)).to eq(59)
  end
  it "test case 3" do
    a = Node.new(42)

    #        

    # max_path_sum(a) # -> 42
    expect(max_path_sum(a)).to eq(42)
  end
end

describe "path_finder" do
  it "test case 1" do
    a = Node.new("a")
    b = Node.new("b")
    c = Node.new("c")
    d = Node.new("d")
    e = Node.new("e")
    f = Node.new("f")

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f

    #      a
    #    /   \
    #   b     c
    #  / \     \
    # d   e     f

    # path_finder(a, 'e') # -> [ 'a', 'b', 'e' ]
    expect(path_finder(a, 'e')).to eq(['a', 'b', 'e'])
  end

  it "test case 2" do
    a = Node.new("a")
    b = Node.new("b")
    c = Node.new("c")
    d = Node.new("d")
    e = Node.new("e")
    f = Node.new("f")
    g = Node.new("g")
    h = Node.new("h")

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f
    e.left = g
    f.right = h

    #      a
    #    /   \
    #   b     c
    #  / \     \
    # d   e     f
    #    /       \
    #   g         h

    # path_finder(a, "c") # -> ['a', 'c']
    expect(path_finder(a, "c")).to eq(['a', 'c'])
  end
end

describe "tree_value_count" do
  it "test case 1" do
    a = Node.new(12)
    b = Node.new(6)
    c = Node.new(6)
    d = Node.new(4)
    e = Node.new(6)
    f = Node.new(12)

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f

    #      12
    #    /   \
    #   6     6
    #  / \     \
    # 4   6     12

    # tree_value_count(a,  6) # -> 3
    expect(tree_value_count(a,  6)).to eq(3)
  end

  it "test case 2" do
    a = Node.new(7)
    b = Node.new(5)
    c = Node.new(1)
    d = Node.new(1)
    e = Node.new(8)
    f = Node.new(7)
    g = Node.new(1)
    h = Node.new(1)

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f
    e.left = g
    f.right = h

    #      7
    #    /   \
    #   5     1
    #  / \     \
    # 1   8     7
    #    /       \
    #   1         1

    # tree_value_count(a, 9) # -> 0
    expect(tree_value_count(a, 9)).to eq(0)
  end
end

describe "#how_high" do
  it "test case 1" do
    a = Node.new('a')
    b = Node.new('b')
    c = Node.new('c')
    d = Node.new('d')
    e = Node.new('e')
    f = Node.new('f')

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f

    #      a
    #    /   \
    #   b     c
    #  / \     \
    # d   e     f

    # how_high(a) # -> 2
    expect(how_high(a)).to eq(2)
  end
  it "test case 2" do
    a = Node.new('a')
    c = Node.new('c')

    a.right = c

    #      a
    #       \
    #        c

    # how_high(a) # -> 1
    expect(how_high(a)).to eq(1)
  end
end

describe "bottom_right_value" do
  it "test case 1" do
    a = Node.new(3)
    b = Node.new(11)
    c = Node.new(10)
    d = Node.new(4)
    e = Node.new(-2)
    f = Node.new(1)
    
    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f
    
    #       3
    #    /    \
    #   11     10
    #  / \      \
    # 4   -2     1
    
    # bottom_right_value(a) # -> 1
    expect(bottom_right_value(a)).to eq(1)
  end

  it "test case 2" do
    a = Node.new(-1)
    b = Node.new(-6)
    c = Node.new(-5)
    d = Node.new(-3)
    e = Node.new(-4)
    f = Node.new(-13)
    g = Node.new(-2)
    h = Node.new(6)
    i = Node.new(7)

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f
    e.left = g
    e.right = h
    f.left = i

    #        -1
    #      /   \
    #    -6    -5
    #   /  \     \
    # -3   -4   -13
    #     / \    /   
    #    -2  6  7 

    # bottom_right_value(a) # -> 7
    expect(bottom_right_value(a)).to eq(7)
  end
end

describe "all_tree_paths" do
  it "test case 1" do
    a = Node.new('a')
    b = Node.new('b')
    c = Node.new('c')
    d = Node.new('d')
    e = Node.new('e')
    f = Node.new('f')

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f

    #      a
    #    /   \
    #   b     c
    #  / \     \
    # d   e     f

    expect(all_tree_paths(a)).to eq([["a", "b", "d"], ["a", "b", "e"], ["a", "c", "f"]])
  end

  it "test case 2" do
    a = Node.new('a')
    b = Node.new('b')
    c = Node.new('c')
    d = Node.new('d')
    e = Node.new('e')
    f = Node.new('f')
    g = Node.new('g')
    h = Node.new('h')
    i = Node.new('i')

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f
    e.left = g
    e.right = h
    f.left = i

    #         a
    #      /    \
    #     b      c
    #   /  \      \
    #  d    e      f
    #      / \    /   
    #     g  h   i 


    expect(all_tree_paths(a)).to eq([["a", "b", "d"], ["a", "b", "e", "g"], ["a", "b", "e", "h"], ["a", "c", "f", "i"]])
  end
end

describe "tree_levels" do
  it "test case 1" do
    a = Node.new('a')
    b = Node.new('b')
    c = Node.new('c')
    d = Node.new('d')
    e = Node.new('e')
    f = Node.new('f')

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f

    #      a
    #    /   \
    #   b     c
    #  / \     \
    # d   e     f
    expect(tree_levels(a)).to eq([["a"], ["b", "c"], ["d", "e", "f"]])
  end

  it "test case 2" do
    a = Node.new('a')
    b = Node.new('b')
    c = Node.new('c')
    d = Node.new('d')
    e = Node.new('e')
    f = Node.new('f')
    g = Node.new('g')
    h = Node.new('h')
    i = Node.new('i')

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f
    e.left = g
    e.right = h
    f.left = i

    #         a
    #      /    \
    #     b      c
    #   /  \      \
    #  d    e      f
    #      / \    /
    #     g  h   i

    expect(tree_levels(a)).to eq([["a"], ["b", "c"], ["d", "e", "f"], ["g", "h", "i"]])
  end
end

describe "level_averages" do
  it "test case 1" do
    a = Node.new(3)
    b = Node.new(11)
    c = Node.new(4)
    d = Node.new(4)
    e = Node.new(-2)
    f = Node.new(1)

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f

    #       3
    #    /    \
    #   11     4
    #  / \      \
    # 4   -2     1

    # level_averages(a) # -> [ 3, 7.5, 1 ]
    expect(level_averages(a)).to eq([3, 7.5, 1])
  end

  it "test case 2" do
    q = Node.new(13)
    r = Node.new(4)
    s = Node.new(2)
    t = Node.new(9)
    u = Node.new(2)
    v = Node.new(42)

    q.left = r
    q.right = s
    r.right = t
    t.left = u
    u.right = v

    #        13
    #      /   \
    #     4     2
    #      \
    #       9
    #      /
    #     2
    #    /
    #   42

    # level_averages(q) # -> [ 13, 3, 9, 2, 42 ]
    expect(level_averages(q)).to eq([13, 3, 9, 2, 42])
  end
end

describe "leaf_list" do
  it "test case 1" do
    a = Node.new("a")
    b = Node.new("b")
    c = Node.new("c")
    d = Node.new("d")
    e = Node.new("e")
    f = Node.new("f")
    
    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f
    
    #      a
    #    /   \
    #   b     c
    #  / \     \
    # d   e     f
    
    # leaf_list(a) # -> [ 'd', 'e', 'f' ]
    expect(leaf_list(a)).to eq(['d', 'e', 'f'])
  end

  it "test case 2" do
    a = Node.new("a")
    b = Node.new("b")
    c = Node.new("c")
    d = Node.new("d")
    e = Node.new("e")
    f = Node.new("f")
    g = Node.new("g")
    h = Node.new("h")
    
    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f
    e.left = g
    f.right = h
    
    #      a
    #    /   \
    #   b     c
    #  / \     \
    # d   e     f
    #    /       \
    #   g         h
    
    # leaf_list(a) # -> [ 'd', 'g', 'h' ]
    expect(leaf_list_rec(a)).to eq(['d', 'g', 'h'])
  end
end
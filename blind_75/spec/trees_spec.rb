require './blind_75/trees.rb'
require 'rspec'

describe "invert binary tree" do
  it "test case 1 " do
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
    c.left = f
    c.right = g

      #      a
      #    /   \
      #   b     c
      #  / \   / \
      # d   e  f  g 
    invert_tree(a)
    expect(a.left.val).to eq('c')
    expect(a.right.val).to eq('b')
    expect(a.left.left.val).to eq('g')
    expect(a.left.right.val).to eq('f')
    expect(a.right.left.val).to eq('e')
    expect(a.right.right.val).to eq('d')
  end
end

describe "max depth of binary tree" do
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

    w = Node.new('w')
    x = Node.new('x')
    y = Node.new('y')
    z = Node.new('z')

    w.right = x
    x.right = y
    y.right = z

    expect(max_depth_bfs(a)).to eq(3)
    expect(max_depth_bfs(w)).to eq(4)

    expect(max_depth_dfs(a)).to eq(3)
    expect(max_depth_dfs(w)).to eq(4)
  end
end

describe "same tree" do
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

    w = Node.new('w')
    x = Node.new('x')
    y = Node.new('y')
    z = Node.new('z')

    w.right = x
    x.right = y
    y.right = z

    expect(is_same_tree(a, a)).to eq(true)
    expect(is_same_tree(a, w)).to eq(false)
  end
end

describe "subtree of another tree" do
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

    expect(is_subtree(a, b)).to eq(true)
  end
end

describe "lowest common ancestor" do
  it "test case 1" do
    a = Node.new(6)
    b = Node.new(2)
    c = Node.new(8)
    d = Node.new(0)
    e = Node.new(4)
    f = Node.new(9)

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f

    expect(lowest_common_ancestor(a, b, c).val).to eq(6)
    expect(lowest_common_ancestor(a, b, e).val).to eq(2)
    expect(lowest_common_ancestor(a, d, f).val).to eq(6)
    expect(lowest_common_ancestor(a, d, e).val).to eq(2)
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
    expect(level_order_dfs(a)).to eq([["a"], ["b", "c"], ["d", "e", "f"]])
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

    expect(level_order(a)).to eq([["a"], ["b", "c"], ["d", "e", "f"], ["g", "h", "i"]])
  end
end

describe "validate binary search tree" do
  it "test case 1" do
    a = Node.new(6)
    b = Node.new(2)
    c = Node.new(8)
    d = Node.new(0)
    e = Node.new(4)
    f = Node.new(9)

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f

    expect(is_valid_bst(a)).to eq(true)

    g = Node.new(5)
    h = Node.new(1)
    i = Node.new(4)
    j = Node.new(3)
    k = Node.new(6)

    g.left = h
    g.right = i
    i.left = j
    i.right = k

    expect(is_valid_bst(g)).to eq(false)
  end
end

describe "kth smallest element in a bst" do
  it "test case 1" do
    a = Node.new(6)
    b = Node.new(2)
    c = Node.new(8)
    d = Node.new(0)
    e = Node.new(4)
    f = Node.new(9)

    a.left = b
    a.right = c
    b.left = d
    b.right = e
    c.right = f

    expect(kth_smallest(a, 1)).to eq(0)
    expect(kth_smallest(a, 2)).to eq(2)
    expect(kth_smallest(a, 3)).to eq(4)
  end
end

describe "construct binary tree from preorder and inorder traversal" do
  it "test case 1" do
    a = Node.new(3)
    b = Node.new(9)
    c = Node.new(20)
    d = Node.new(15)
    e = Node.new(7)

    a.left = b
    a.right = c
    c.left = d
    c.right = e
    
    tree = build_tree([3,9,20,15,7], [9,3,15,20,7])
    expect(is_same_tree(a, tree)).to eq(true)
  end
end

describe "binary tree maximum path sum" do
  it "test case 1" do
    a = Node.new(1)
    b = Node.new(2)
    c = Node.new(3)

    a.left = b
    b.right = c

    d = Node.new(-10)
    e = Node.new(9)
    f = Node.new(20)
    g = Node.new(15)
    h = Node.new(7)

    d.left = e
    d.right = f
    f.left = g
    f.right = h

    expect(max_path_sum(a)).to eq(6)
    expect(max_path_sum(d)).to eq(42)
  end
end
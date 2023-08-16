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
    tree = invert_tree(a)
    expect(tree.left.val).to eq('c')
    expect(tree.right.val).to eq('b')
    expect(tree.left.left.val).to eq('g')
    expect(tree.left.right.val).to eq('f')
    expect(tree.right.left.val).to eq('e')
    expect(tree.right.right.val).to eq('d')
  end
end

describe "max depth of binary tree" do

end

describe "same tree" do

end

describe "subtree of another tree" do

end
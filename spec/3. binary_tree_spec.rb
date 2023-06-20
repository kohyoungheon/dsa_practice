require './3. binary_tree.rb'
require 'rspec'

describe "binary_tree" do
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
      expect(tree_includes_rec(a, "p")).to eq(false)
    end
  end
end
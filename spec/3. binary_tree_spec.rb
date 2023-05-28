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

end
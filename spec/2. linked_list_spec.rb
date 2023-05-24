require './2. linked_list.rb'
require 'rspec'

describe "array_and_string" do
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

    it "test case 4" do
      node1 = Node.new(42)
      expect(linked_list_find(node1, 42)).to eq(true)
    end

    it "test case 5" do
      node1 = Node.new(42)
      expect(linked_list_find(node1, 100)).to eq(false)
    end
  end

  describe "get node value" do
    it "test case 1" do
      a = Node.new("a")
      b = Node.new("b")
      c = Node.new("c")
      d = Node.new("d")

      a.next = b
      b.next = c
      c.next = d

      expect(get_node_value(a, 2)).to eq("c")
      expect(get_node_value(a, 3)).to eq("d")
      expect(get_node_value(a, 7)).to eq(nil)
    end

    it "test case 2" do
      node1 = Node.new("banana")
      node2 = Node.new("mango")

      node1.next = node2

      expect(get_node_value(node1, 0)).to eq("banana")
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

      zipper_merged = zipper_lists(a, x)
      expect(zipper_merged.data).to eq("a")
      expect(zipper_merged.next).to eq(x)
      expect(zipper_merged.next.next).to eq(b)
      expect(zipper_merged.next.next.next).to eq(y)
    end
    it "test case 2" do

    end
  end
end
class Node
  attr_accessor :data, :next  
  def initialize(data)
    @data = data
    @next = nil
  end
end

class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

def make_list(nodes)
  return nil if nodes.empty?

  head = Node.new(nodes[0])
  current = head

  nodes[1..-1].each do |node_data|
    new_node = Node.new(node_data)
    current.next = new_node
    current = new_node
  end

  head
end

#______________________________________________________________________
# prev->A->B->C->D
def reverse_list(head)
  current = head
  prev = nil

  while !current.nil?
    next_node = current.next
    current.next = prev
    prev = current
    current = next_node
  end
  prev
end
#_____________________________________________________________-
def merge_two_lists(list_1, list_2)
  dummy_head = Node.new(nil)
  current = dummy_head

  while list_1 && list_2
    if list_1.data < list_2.data
      current.next = list_1
      list_1 = list_1.next
    else
      current.next = list_2
      list_2 = list_2.next
    end
    current = current.next
  end

  current.next = list_1 if list_1
  current.next = list_2 if list_2

  dummy_head.next
end
#______________________________________________________________________







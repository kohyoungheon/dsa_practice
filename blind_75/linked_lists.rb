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


# def create_linked_list(nodes, index = 0)
#   return nil if index >= nodes.length

#   head = Node.new(nodes[index])
#   head.next = create_linked_list(nodes, index + 1)
#   head
# end

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

def reorder_list(head)
  return if head.nil? || head.next.nil?

  # Find middle
  slow = head
  fast = head.next
  while fast && fast.next
    slow = slow.next
    fast = fast.next.next
  end

  # Reverse second half
  second = slow.next
  slow.next = nil
  prev = nil
  while second
    tmp = second.next
    second.next = prev
    prev = second
    second = tmp
  end

  # Merge two halves
  first = head
  second = prev
  while second
    tmp1 = first.next
    tmp2 = second.next
    first.next = second
    second.next = tmp1
    first = tmp1
    second = tmp2
  end

  head
end
#___________________________________________________-
def remove_nth_from_end(head, n)
  dummy = Node.new(nil)
  dummy.next = head
  
  left = dummy
  right = head

  n.times do
    right = right.next
  end

  while right
    left = left.next
    right = right.next
  end

  # Delete
  left.next = left.next.next
  dummy.next
end




class Node
  attr_accessor :data, :next  
  def initialize(data)
    @data = data
    @next = nil
  end
end

#Time: O(n), and the space complexity is O(n).
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
# Time: O(n), and the space complexity is O(1)
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
# Time: O(n), and the space complexity is O(1)
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
# Time: O(n), and the space complexity is O(1).
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
  while second #only second half can be 1 shorter
    tmp1 = first.next
    tmp2 = second.next
    first.next = second
    second.next = tmp1
    first = tmp1
    second = tmp2
  end

  head
end
#___________________________________________________
# Time: O(n), and the space complexity is O(1).
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
#____________________________________________________
# O(n), and the space complexity is O(1)
def has_cycle(head)
  return false if head.nil?

  slow = head
  fast = head

  while fast && fast.next
    slow = slow.next
    fast = fast.next.next
    return true if slow == fast
  end

  false
end
#____________________________________________________
# Time: O(n * log k), and the space complexity is O(k).
#n = total number of nodes and k = number of lists
# Input: lists = [[1,4,5],[1,3,4],[2,6]]
# Output: [1,1,2,3,4,4,5,6]
def merge_k_lists(lists)
  return nil if lists.nil? || lists.empty?

  while lists.length > 1
    merged_lists = []
    (0...lists.length).step(2) do |i|
      l1 = lists[i]
      l2 = (i + 1) < lists.length ? lists[i + 1] : nil
      merged_lists << merge_two_lists(l1, l2)
    end
    lists = merged_lists
  end
  lists[0]
end
#______________________________________________


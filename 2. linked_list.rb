class Node
  attr_accessor :data, :next  
  def initialize(data)
    @data = data
    @next = nil
  end
end
#_______________________________________________________________________
# A -> B -> C -> D

# def linked_list_values(head)
#   current = head
#   while current != nil
#     puts current.data
#     current = current.next
#   end
# end

#Recursive
def linked_list_values(head)
  values = []
  fill_values(head, values)
  return values
end

#Recursive Helper Method
def fill_values(head, values)
  if head == nil
    return
  end
  values << head.data
  fill_values(head.next, values)
end
#_______________________________________________________________________

def sum_list(head)
  value = [0]
  sum_list_helper(head, value)
  return value[0]
end

def sum_list_helper(head, value)
  if head == nil
    return value
  end
  value[0] += head.data
  sum_list_helper(head.next, value)
end
#recursive
def sum_list_best_solution(head)
  if head == nil
    return 0
  end
  return head.data + sum_list_best_solution(head.next)
end
#______________________________________________________________________

def linked_list_find(head, target)
  current = head
  while current != nil
    if current.data == target
      return true
    end
    current = current.next
  end
  return false
end
#______________________________________________________________________
#Iterative
def get_node_value(head, index)
  current = head
  count = 0
  while current != nil
    if count == index
      return current.data
    end
    count += 1
    current = current.next
  end  
end

#Recursive
def get_node_value_recursive(head, index)
  if head == nil
    return nil
  end
  if index == 0
    return head.data
  end
  get_node_value(head.next, index - 1)
end
#______________________________________________________________________
def reverse_list(head)
  prev = nil
  current = head
  while current != nil
    next_node = current.next
    current.next = prev
    prev = current
    current = next_node
  end
  return prev
end

def reverse_list_recursively(head, prev = nil)
  if head == nil
    return prev
  end
  next_node = head.next
  head.next = prev
  reverse_list_recursively(next_node, head)
end
#______________________________________________________________________

def zipper_lists(head_1,head_2)
  tail = head_1
  current_1 = head_1.next
  current_2 = head_2
  count = 0
  while current_1 != nil && current_2 != nil
    if count % 2 == 0
      tail.next = current_2
      current_2 = current_2.next
    else
      tail.next = current_1
      current_1 = current_1.next
    end
    tail = tail.next
    count += 1
  end
  #if lists are uneven and nodes are leftover
  if current_1 != nil
    tail.next = current_1
  end
  if current_2 != nil
    tail.next = current_2
  end
  return head_1
end

def zipper_lists_recursively(head_1,head_2)
  if head_1 == nil && head_2 == nil
    return nil
  end
  if head_1 == nil
    return head_2
  end
  if head_2 == nil
    return head_1
  end

  next_1 = head_1.next
  next_2 = head_2.next

  head_1.next = head_2
  head_2.next = zipper_lists_recursively(next_1, next_2)
  return head_1
  
end
#______________________________________________________________________

def merge_lists(head_1, head_2)
  dummy_head = Node.new(nil)
  tail = dummy_head
  current_1 = head_1
  current_2 = head_2

  while current_1 != nil && current_2 !=nil
    if current_1.data < current_2.data
      tail.next = current_1
      current_1 = current_1.next
    else
      tail.next = current_2
      current_2 = current_2.next
    end
    tail = tail.next
  end

  if current_1 != nil
    tail.next = current_1
  end

  if current_2 != nil
    tail.next = current_2
  end

  return dummy_head.next
end

def merge_lists_recursive(head_1, head_2)
  if head_1 == nil && head_2 == nil
    return nil
  end

  if head_1 == nil
    return head_2
  end

  if head_2 == nil
    return head_1
  end

  if head_1.data < head_2.data
    next_1 = head_1.next
    head_1.next = merge_lists_recursive(next_1, head_2)
    return head_1
  else
    next_2 = head_2.next
    head_2.next = merge_lists_recursive(head_1, next_2)
    return head_2
  end
end

def is_univalue_list(head)
  current = head
  while current != nil
    if current.data != head.data
      return false
    end
    current = current.next
  end
  return true
end

def is_univalue_list_recursive(head, prev_val = nil)
  if head == nil
    return true
  end

  if prev_val != nil && head.data != prev_val
    return false
  end
  is_univalue_list_recursive(head.next, head.data)
end
#______________________________________________________________________

def longest_streak(head)
  max_streak = 0
  current_streak = 0
  prev_val = nil
  current = head

  while current != nil
    if current.data == prev_val
      current_streak += 1
    else
      current_streak = 1
    end

    prev_val = current.data

    if current_streak > max_streak
      max_streak = current_streak
    end

    current = current.next

  end
  return max_streak
end

def remove_node(head, target)
  
end
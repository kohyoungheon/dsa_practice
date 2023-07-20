class Node
  attr_accessor :val, :next  
  def initialize(val)
    @val = val
    @next = nil
  end
end
#______________________________________________________________________
# n = number of nodes, Time: O(n), Space: O(n)
def linked_list_values(head)
  values = []
  current = head

  while !current.nil?
    values << current.val
    current = current.next
  end

  values
end
# n = number of nodes, Time: O(n), Space: O(n)
def linked_list_values_rec(head)
  values = []
  fill_values(head.next,values)
  values
end
def fill_values(head,values)
  return if head.nil?
  values << head.val
  fill_values(head.next,values)
end
#_____________________________________________
# n = number of nodes, Time: O(n), Space: O(1)
def sum_list(head)
  total = 0
  current = head
  while current != nil
    total += current.val
    current = current.next
  end
  total
end
# n = number of nodes, Time: O(n), Space: O(n) because of call stack
def sum_list_rec(head)
  return 0 if head.nil?
  return head.val + sum_list_rec(head.next)
end

#______________________________________________
# n = number of nodes, Time: O(n), Space: O(1)
def linked_list_find(head, target)
  current = head
  while current != nil
    return true if current.val == target
    current = current.next
  end
  return false
end
# n = number of nodes, Time: O(n), Space: O(n)
def linked_list_find_rec(head, target)
  return false if head.nil?
  return true if head.val == target
  linked_list_find_rec(head.next, target)
end
#____________________________________________
# n = number of nodes, Time: O(n), Space: O(1)
def get_node_value(head, index)
  current = head
  count = 0
  while !current.nil?
    return current.val if count == index
    count += 1
    current = current.next
  end
end
# n = number of nodes, Time: O(n), Space: O(n)
def get_node_value_rec(head, index)
  return nil if head.nil?
  return head.val if index == 0
  get_node_value_rec(head.next, index - 1)
end
#_______________________________________________
# n = number of nodes, Time: O(n), Space: O(1)
def reverse_list(head)
  current = head
  prev = nil
  while !current.nil?
    nxt = current.next
    current.next = prev
    prev = current
    current = nxt
  end
  return prev
end
# n = number of nodes, Time: O(n), Space: O(n)
def reverse_list_rec(head, prev = nil)
  return prev if head.nil?
  nxt = head.next
  head.next = prev
  reverse_list_rec(nxt, head)
end
#_____________________________________________

# n = length of list 1, m = length of list 2, Time: O(min(n, m)), Space: O(1)
def zipper_lists(head_1, head_2)
  tail = head_1
  current_1 = head_1.next
  current_2 = head_2
  count = 0

  while !current_1.nil? && !current_2.nil?
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


  tail.next = current_1 if !current_1.nil?
  tail.next = current_2 if !current_2.nil?

  return head_1
end
# n = length of list 1, m = length of list 2, Time: O(min(n, m)), Space: O(min(n, m))
def zipper_lists_rec(head_1,head_2)
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
  head_2.next = zipper_lists_rec(next_1, next_2)
  return head_1
  
end
#_______________________________________________________
# n = length of list 1, m = length of list 2, Time: O(min(n, m)), Space: O(1)
def merge_lists(head_1, head_2)
  dummy_head = Node.new(nil)
  tail = dummy_head

  current_1 = head_1
  current_2 = head_2

  while !current_1.nil? && !current_2.nil?
    if current_1.val < current_2.val
      tail.next = current_1
      current_1 = current_1.next
    else
      tail.next = current_2
      current_2 = current_2.next
    end
    tail = tail.next

    tail.next = current_1 if !current_1.nil?
    tail.next = current_2 if !current_2.nil?
  end

  return dummy_head.next
end

# n = length of list 1, m = length of list 2, Time: O(min(n, m)), Space: O(min(n, m))
def merge_lists_rec(head_1, head_2)
  return nil if head_1.nil? && head_2.nil?
  return head_1 if head_2.nil?
  return head_2 if head_1.nil?

  if head_1.val < head_2.val
    next_1 = head_1.next
    head_1.next = merge_lists(next_1, head_2)
    head_1
  else
    next_2 = head_2.next
    head_2.next = merge_lists(head_1, next_2)
    head_2
  end
end
#______________________________________________________
# n = number of nodes, Time: O(n), Space: O(1)
def is_univalue_list(head)
  current = head
  while !current.nil?
    return false if head.val != current.val
    current = current.next
  end
  return true
end
# n = number of nodes, Time: O(n), Space: O(n)
def is_univalue_list_rec(head, prev_val = nil)
  return true if head.nil?
  return false if !prev_val.nil? && head.val != prev_val

  return is_univalue_list_rec(head.next, head.val)

end

#____________________________________________________
#n = number of nodes, Time: O(n), Space: O(1)
def longest_streak(head)
  max_streak = 0
  current_streak = 0
  prev_val = nil

  current = head

  while !current.nil?
    if current.val == prev_val
      current_streak += 1
    else
      current_streak = 1
    end
    
    prev_val = current.val

    if current_streak > max_streak
      max_streak = current_streak
    end

    current = current.next
  end
  
  return max_streak
end
#_____________________________________________
# n = number of nodes,Time: O(n),Space: O(1)
def remove_node(head, target)
  return head.next if head.val == target
  current = head
  prev = nil

  while !current.nil?
    if current.val == target
      prev.next = current.next
      break
    end

    prev = current
    current = current.next
  end

  return head
end
# n = number of nodes, Time: O(n), Space: O(n)
def remove_node_rec(head, target)
  return nil if head.nil?
  return head.next if head.val == target

  head.next = remove_node_rec(head.next, target)
  head
end

#__________________________________________________
# n = number of nodes, Time: O(n), Space: O(1)
def insert_node(head, value, index)
  new_node = Node.new(value)
  
  if index == 0
    new_node.next = head
    return new_node
  end

  current = head
  count = 0

  while !current.nil?
    if count == index -1
      temp = current.next
      current.next = new_node
      current.next.next = temp
    end

    count += 1
    current = current.next
  end

  head
end

# n = number of nodes, Time: O(n), Space: O(n)
def insert_node_rec(head, value, index, count = 0)
  
  if index == 0
    new_node = Node.new(value)
    new_node.next = head
    return new_node
  end

  return nil if head.nil?

  if count == index - 1
    temp = head.next
    head.next = Node.new(value)
    head.next.next = temp
    return
  end

  insert_node_rec(head.next, value, index, count + 1)
  return head
end
#_____________________________________________________
# n = length of values, Time: O(n), Space: O(n)
def create_linked_list(values)
  dummy_head = Node.new(nil)
  tail = dummy_head
  values.each do |value|
    tail.next = Node.new(value)
    tail = tail.next
  end
  dummy_head.next
end
# n = length of values, Time: O(n), Space: O(n)
def create_linked_list_rec(values)
  return nil if values.length == 0
  head = Node.new(values[0])
  head.next = create_linked_list_rec(values[1..-1])
  return head
end

#______________________________________________________
#handle same length lists
#handle diff length lists
#handle carry
#handle final carry (output list is bigger than inputs)

def add_lists(head_1, head_2, carry = 0)
  return nil if head_1.nil? && head_2.nil? && carry == 0

  val_1 = head_1.nil? ? 0 : head_1.val
  val_2 = head_2.nil? ? 0 : head_2.val

  sum = val_1 + val_2 + carry
  next_carry = sum > 9 ? 1 : 0

  digit = sum % 10
  result_node = Node.new(digit)

  next_1 = head_1.nil? ? nil : head_1.next
  next_2 = head_2.nil? ? nil : head_2.next


  result_node.next = add_lists(next_1, next_2, next_carry)

  return result_node
end
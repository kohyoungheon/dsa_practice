def remove_nth_from_end(head, n)
  dummy = Node.new(nil)
  dummy.next = head

  left = dummy
  right = head
  n.times do 
    right = right.next
  end

  while right
    right = right.next
    left = left.next
  end

  left.next = left.next.next
  dummy.next
end
#____________________________________________________
# O(n), and the space complexity is O(1)
def has_cycle(head)
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

end
#________
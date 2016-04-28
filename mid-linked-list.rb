
class Node
  attr_accessor :node, :next
  def initialize(node)
    @node = node
    @next = nil
  end
end

def find_mid(head)
  return head if head.nil? || head.next.nil?
  slow = head
  fast = head
  while (fast!=nil || fast.next!=nil)
    slow = slow.next
    fast = fast.next.next
  end
  slow #points to mid
end


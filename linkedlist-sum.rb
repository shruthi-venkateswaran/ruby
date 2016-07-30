

class ListNode
  attr_accessor :value, :next
  def initialize(value)
    @value = value
    @next = nil
  end
end

class LinkedList
  attr_accessor :head, :current
  def initialize
    @head = nil
    @current = nil
  end

  def add(value)
    if @current.nil?
      @head = @current = ListNode.new(value)
    else
      @current.next = ListNode.new(value)
      @current = @current.next
    end
  end

  def reverse
    return @head if @head.nil? || @head.next.nil?

    curr  = @head
    next2curr = curr.next
    while(!next2curr.nil?)
      temp = next2curr.next
      next2curr.next = curr
      curr = next2curr
      next2curr = temp
    end
    @head.next = nil
    @head = curr
    return self
  end
end

def add_two_numbers(l1, l2)
  return ListNode.new(nil) if l1.nil? && l2.nil?

  final_list = LinkedList.new

  ptr1 = l1.head
  ptr2 = l2.head
  carry = 0
  while (!ptr1.nil? || !ptr2.nil? || carry!=0)
    l1_value = (ptr1.nil? ? 0 : ptr1.value)
    l2_value = (ptr2.nil? ? 0 : ptr2.value)
    sum = l1_value + l2_value + carry
    carry = sum/10
    final_list.add(sum%10)
    ptr1 = ptr1.next unless ptr1.nil?
    ptr2 = ptr2.next unless ptr2.nil?
  end
  final_list.reverse
end

if __FILE__ == $PROGRAM_NAME
  l1 = LinkedList.new
  l1.add(1)
  l1.add(2)

  l2 = LinkedList.new
  l2.add(3)
  l2.add(9)
  l2.add(4)

  final_sum = add_two_numbers(l1,l2)
  # p final_sum
  l3 = final_sum.head
  puts "The sum is:"
  while !l3.nil?
    print "#{l3.value} -> "
    l3 = l3.next
  end
  print 'nil'
end

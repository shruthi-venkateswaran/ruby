# given an array of elements, for each element count the number of smaller numbers to the right
# Ex: [4,12,5,6,1,34,3,2]
# Output: [3,5,3,3,0,2,1,0]
# work out with paper/pen to understand better :). Good practice to revise the logic

class Node
  attr_reader :data
  attr_accessor :left_size, :left, :right
  def initialize(data)
    @data = data
    @left_size = 0
  end
end

def count_smaller_on_right(arr)
  result = []
  arr_len = arr.length
  root = Node.new(arr[arr_len-1])
  result[arr_len-1] = 0

  i = arr_len - 2

  while i>=0 do
    c = 0
    current = root

    while !current.nil?
      parent = current
      if current.data < arr[i]
        c = c + current.left_size + 1
        current = current.right
      else
        current.left_size += 1
        current = current.left
      end
    end

    if parent.data <= arr[i]
      parent.right = Node.new(arr[i])
    else
      parent.left = Node.new(arr[i])
    end

    result[i] = c

    i = i - 1
  end

  result
end

if __FILE__ == $PROGRAM_NAME
  p count_smaller_on_right([4,12,5,6,1,34,3,2])
  p count_smaller_on_right([40, 20, 10, 50, 20, 40, 30])
end

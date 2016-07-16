        # 1
      # /   \
    # 2      5
  # /   \   / \
  # 3   4  6   7
  # represented as [1,2,5,3,4,6,7] (left child = 2i+1 and right child = 2i+2)
# Print all paths from root to leaf node in a binary tree

def left(index)
  2*index + 1
end

def right(index)
  2*index + 2
end

def print_all_paths(tree_array)
  return if tree_array.nil? || tree_array.empty?

  visited = []

  (0..tree_array.length-1).each do |k|
    visited[k] = 0
  end

  stack = []

  stack.push(0) # push index of root

  while (!stack.empty?)
    current = stack.last

    left_child = left(current)
    right_child = right(current)

    if left_child < tree_array.length && visited[left_child] != 1 # left child exists and is not visited
      stack.push(left_child)
      current = left_child
    elsif right_child < tree_array.length && visited[right_child] != 1 # right child exists and is not visited
      stack.push(right_child)
      current = right_child
    else #leaf node or node with both left and right subtrees visited
      visited[current] = 1

      if left_child >= tree_array.length && right_child >= tree_array.length # leaf node
        puts "One path is:"
        stack.each do |i|
          print "#{tree_array[i]} ->"
        end
          print 'nil'
          puts
      end
      stack.pop #remove leaf node index
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  print_all_paths([1,2,5,3,4,6,7])
  p '--------------'
  print_all_paths([])
  p '--------------'
  print_all_paths([5, 1, 3, 8, 6, 9])
  p '--------------'
  print_all_paths([1,2,3])
end

# You are given a pointer to the root of a binary tree. Print the top view of the binary tree.
# You only have to complete the function.
# For example :
#
#      3
#    /   \
#   5     2
#  / \   / \
# 1   4 6   7
#  \       /
#   9     8
# Top View : 1 -> 5 -> 3 -> 2 -> 7

def top_view(root)
  return if root.nil?
  top_view_array = []
  left_node = root.left
  while(!left_node.nil?)
    top_view_array.push(left_node.value)
    left_node = left_node.left
  end
  top_view_array = top_view_array.reverse
  top_view_array.push(root.value)
  right_node = root.right
  while(!right_node.nil?)
    top_view_array.push(right_node.value)
    right_node = right_node.right
  end

  puts top_view_array.join(' ')
end

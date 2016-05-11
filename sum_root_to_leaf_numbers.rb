# Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number. Find the total sum of all root-to-leaf numbers.
#
# For example,
#
#     1
#    / \
#   2   3
# The root-to-leaf path 1->2 represents the number 12.
# The root-to-leaf path 1->3 represents the number 13.
# Return the sum = 12 + 13 = 25.

total_sum = 0

def sum_root_to_leaf(root)
  return if root.nil?
  do_sum(root, 0)
end

def do_sum(root, current_sum)
  return if root.nil?
  current_sum = current_sum*10 + root.value
  if root.is_leaf?
    total_sum += current_sum
  else
    do_sum(root.left, current_sum)
    do_sum(root.right, current_sum)
  end
end

# Final sum = total_sum

# http://www.programcreek.com/2014/05/leetcode-sum-root-to-leaf-numbers-java/

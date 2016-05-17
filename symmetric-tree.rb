# Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
#
# For example, this binary tree is symmetric:
#
#     1
#    / \
#   2   2
#  / \ / \
# 3  4 4  3
# http://www.programcreek.com/2014/03/leetcode-symmetric-tree-java/

def symmetric_tree(root)
  return true if root.nil?
  return symmetric_tree_check(root.left, root.right)
end

def symmetric_tree_check(l , r)
  return true if !l && !r
  return false if !l || !r
  return false if l.value != r.value
  return false if !symmetric_tree_check(l.left, r.right)
  return false if !symmetric_tree_check(l.right, r.left)
  return true
end

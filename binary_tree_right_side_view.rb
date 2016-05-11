# Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom. For example, given the following binary tree,
#
#    1            <---
#  /   \
# 2     3         <---
#  \
#   5             <---
# You can see [1, 3, 5].
# http://www.programcreek.com/2014/04/leetcode-binary-tree-right-side-view-java/

def binary_tree_right_side_view(root)
  right_view_array = []
  queue = []
  return right_view_array if root.nil?
  queue.push(root)
  while(queue.length > 0)
    size = queue.length

    (0..size-1).each do |i|
      top = queue.shift

      if i == 0
        right_view_array.push(top)
      end

      if top.right?
        queue.push(top.right)
      end

      if top.left?
        queue.push(top.left)
      end
    end
  end

  return right_view_array
end

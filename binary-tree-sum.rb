# 4 <-- 4
# / \
# 3   4 <-- 7
# /  \   \
# 1   2   5 <-- 8
#
# 8   9    5


class TreeNode
 attr_accessor :left, :right, :value

 def initialize(value=nil)
     @left = nil
     @right = nil
     @value = value
 end
end

class Tree
 attr_accessor :root

 def initialize
     @root = nil
 end

 def has_sum(root, int_target) # sum of nodes at each level
     return false root.nil?
     queue = []
     queue.push(root)

     while(queue.size > 0)
         size = queue.size
         sum = 0
         size.times
             node = queue.shift
             sum += node.value

             queue.push(node.right) if node.right?
             queue.push(node.left) if node.left?

         end
         return true if sum == intTarget
     end

     return false
 end

 def has_root_leaf_sum(root, sum)
     return false if root.nil?
     return true if root.leaf? && root.value == sum
     return has_root_leaf_sum(root.left, sum - root.value) || has_root_leaf_sum(root.right, sum - root.value)
 end

 def has_root_leaf_sum(root, sum)
     stack = []
     return false if root.nil?
     stack.push([root, root.value])

     while !stack.empty?
         node = stack.pop
         return true if node[0].leaf? && sum == node[1]
         node.push([node[0].left, node[1] + node[0].left.value] if node[0].left?
         node.push([node[0].right, node[1] + node[0].right.value] if node[0].right?
     end

     return false
 end

end

# complexity => O(number_of_nodes_in_the_tree)

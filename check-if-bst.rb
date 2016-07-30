# Given a binary tree, check if it a BST

class TreeNode
  attr_accessor :data, :right, :left
  def initialize(data)
    @data = data
    @right = @left = nil
  end

  def left?
    !@left.nil?
  end

  def right?
    !@right.nil?
  end
end

def check_if_bst(root)
  return true if root.nil?
  return false if root.left? && root.left.data > root.data
  return false if root.right? && root.right.data < root.data
  return false if !check_if_bst(root.left) || !check_if_bst(root.right)
  return true
end

def build_bst
  root = TreeNode.new(4)
  l1 = TreeNode.new(2)
  r1 = TreeNode.new(6)
  root.left = l1
  root.right = r1

  l2 = TreeNode.new(1)
  r2 = TreeNode.new(3)
  l1.left = l2
  l1.right = r2

  l3 = TreeNode.new(5)
  r3 = TreeNode.new(7)
  r1.left = l3
  r1.right = r3

  root
end
if __FILE__ == $PROGRAM_NAME

  newtree = build_bst
  puts check_if_bst(newtree)
  puts check_if_bst(nil)
end

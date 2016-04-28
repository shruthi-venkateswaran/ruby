# create a list of all nodes at each depth (eg, if you have a tree with depth D there will be D lists)

class TreeNode
  attr_accessor :value, :left, :right
  def initialize(val)
    @value = val
    @left = @right = nil
  end
end

class Tree
  attr_accessor :root, :lists
  def initialize(root=nil)
    @root = root
    @lists = {}
  end

  def create_lists
    create_util(@root, 0)
    p @lists
  end

  private
  def create_util(root_node, level)
    return if root_node.nil?

    @lists[level] = [] if @lists[level].nil?
    @lists[level].push(root_node.value)

    create_util(root_node.left, level+1)
    create_util(root_node.right, level+1)
  end
end

if __FILE__ == $PROGRAM_NAME
  t1 = TreeNode.new(1)
  t2 = TreeNode.new(2)
  t3 = TreeNode.new(3)
  t4 = TreeNode.new(4)
  t5 = TreeNode.new(5)

  t1.left = t2
  t1.right = t3
  t2.left = t4
  t3.right = t5

  tree = Tree.new(t1) # root
  tree.create_lists
end

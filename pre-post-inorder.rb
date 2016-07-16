
class Stack
    attr_reader :elements
    def initialize
        @elements = []
    end
    def length
        @elements.length
    end
    # Return self
    def push(x)
        @elements.push x
        self
    end
    def pop
        @elements.pop
    end
    def peek
        @elements[-1]
    end
end

class TreeNode
  attr_accessor :value, :left, :right
  def initialize(val)
    @value = val
    @left = @right = nil
  end
end

class Tree
  attr_accessor :root
  def initialize(root=nil)
    @root = root
  end

  def preorder #root,left,right
    result = []
    return result if @root.nil?
    stack = Stack.new
    stack.push(@root)
    while(!stack.empty?)
      n = stack.pop
      result.push(n.value)

      stack.push(n.right) if n.right
      stack.push(n.left) if n.left
    end
    result #treat result as a queue, so actual order is same as result
  end

  def inorder #left,root,right
    result = []
    return result if @root.nil?
    stack = Stack.new
    p = @root
    while(!stack.empty? || !p.nil?)
      if(!p.nil?)
        # if it is not null, push to stack
        # and go down the tree to left
        stack.push(p)
        p = p.left
      else
        # if no left child
        # pop stack, process the node
        # then let p point to the right
        t = stack.pop
        result.push(t.value)
        p = t.right
      end
    end
    result
  end

  # http://www.programcreek.com/2014/07/leetcode-kth-smallest-element-in-a-bst-java/
  def kthsmallest(k) #left,root,right
    result = 0
    stack = Stack.new
    p = @root
    while(!stack.empty? || !p.nil?)
      if(!p.nil?)
        # if it is not null, push to stack
        # and go down the tree to left
        stack.push(p)
        p = p.left
      else
        # if no left child
        # pop stack, process the node
        # then let p point to the right
        t = stack.pop
        k -= 1
        if k == 0
          result = t.value
          break
        end
        p = t.right
      end
    end
    result
  end

  def postorder #left,right,root
    result = []
    return result if @root.nil?
    stack = Stack.new
    stack.push(@root)
    while(!stack.empty?)
      current = stack.peek
      stack.pop
      result.push(current.value)
      stack.push(current.left) if current.left
      stack.push(current.right) if current.right
    end
    result.reverse #treat result as a stack, so actual order is reverse of result
    #TODO
    # http://algorithmsandme.in/2015/03/post-order-traversal-of-binary-search-tree-without-recursion/
  end
end

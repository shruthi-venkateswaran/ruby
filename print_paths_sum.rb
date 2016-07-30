        # 1
      # /   \
     # 2      5
   # /   \   / \
  # 3     4 6   7
# represented as [1,2,5,3,4,6,7] (left child = 2i+1 and right child = 2i+2)
# Print all paths from root to leaf node in a binary tree that sum upto a value
class PrintPaths
  attr_reader :arr
  def initialize(arr=nil)
    @arr = arr
  end

  def has_path_sum(root_index, sum) # path starting at root, return true if path to leaf node exists adding upto sum
    len = @arr.length
    return false if ( root_index >= len ) || @arr.nil?
    return true if ( @arr[root_index]==sum && left(root_index)>=len && right(root_index)>=len )
    return has_path_sum(left(root_index), sum - @arr[root_index]) || has_path_sum(right(root_index), sum - @arr[root_index] )
  end

  def print_paths(sum) # path need not start at root, print all paths that add upto sum
    return if @arr.nil? || @arr.empty?
    path = []
    level = 0
    root = 0 # index of root
    print_path_without_need_to_start_at_root(root, path, level, sum)
  end

  private

  def left(index)
    2*index + 1
  end

  def right(index)
    2*index + 2
  end

  def print_util(path, first, last)
    (first..last).each do |i|
      print "#{@arr[i]} ->"
    end
      print 'nil'
      puts
  end

  def print_path_without_need_to_start_at_root(root_index, path, level, sum)
    p 'helllo'
    p root_index
    p path
    p level
    p sum
    return if @arr[root_index].nil?
    tmp = sum
    i = level
    path[level] = @arr[root_index] # put root node value into the path
    while(i>=0)
      tmp -= path[i]
      break if tmp == 0
      i -= 1
    end

    if tmp == 0
      print_util(path, i, level)
    else
      print_path_without_need_to_start_at_root(left(root_index), path, level+1, sum)
      print_path_without_need_to_start_at_root(right(root_index), path, level+1, sum)
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  pp = PrintPaths.new([1,2,5,3,4,6,7])
  pp.print_paths(11)
  puts pp.has_path_sum(0,12)
  puts pp.has_path_sum(0,14)
end

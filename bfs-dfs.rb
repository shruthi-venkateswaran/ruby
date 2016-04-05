# Represent Graph.
# See if a path exists from node 1 to node 2
# Directed graph, BFS, DFS
# Important Graph representation doc : https://www.khanacademy.org/computing/computer-science/algorithms/graph-representation/a/representing-graphs
# http://www.sitepoint.com/graph-algorithms-ruby/
# Time complexity : http://stackoverflow.com/questions/11468621/why-is-the-time-complexity-of-both-dfs-and-bfs-o-v-e

def depth_first_search(adj_matrix, source_index, end_index) #LIFO
  node_stack = [source_index]

  loop do
    curr_node = node_stack.pop
    return false if curr_node == nil
    return true if curr_node == end_index

    children = (0..adj_matrix.length-1).to_a.select do |i|
      adj_matrix[curr_node][i] == 1
    end

    node_stack = node_stack + children
  end
end

def breadth_first_search(adj_matrix, source_index, end_index) #FIFO
  node_queue = [source_index]

  loop do
    curr_node = node_queue.pop

    return false if curr_node == nil
    return true if curr_node == end_index

    children = (0..adj_matrix.length-1).to_a.select do |i|
      adj_matrix[curr_node][i] == 1
    end

    node_queue = children + node_queue
  end
end
# Another approach : http://haozeng.github.io/blog/2014/01/05/trees-in-ruby/
# https://courses.cs.washington.edu/courses/cse326/03su/homework/hw3/dfs.html

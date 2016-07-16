# Given a m x n grid filled with non-negative numbers,
# find a path from top left to bottom right which minimizes the sum of all numbers along its path.
# you can only move right or down
# http://www.programcreek.com/2014/05/leetcode-minimum-path-sum-java/
# grid = mXn => [][]

def minimum_path_sum(grid)
  m = grid.length
  n = grid[0].length
  dp = Array.new(m) { Array.new(n) }
  dp[0][0] = grid[0][0]

  #initialize top row
  (1..n-1).each do |i|
    dp[0][i] = dp[0][i-1] + grid[0][i]
  end

  #initialize left column
  (1..m-1).each do |j|
    dp[j][0] = dp[j-1][0] + grid[j][0]
  end

  i = 1

  # fill the dp table
  while (i < m) # i is the row
    j = 1
    while (j<n) # j is the column
      if dp[i-1][j] > dp[i][j-1]
        dp[i][j] = dp[i][j-1] + grid[i][j]
      else
        dp[i][j] = dp[i-1][j] + grid[i][j]
      end

      j += 1
    end
    i += 1
  end
end

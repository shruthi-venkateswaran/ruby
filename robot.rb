# A grid, n x n nodes
# A robot starts at (0,0) and needs to get to (n-1, n-1).
# It can only move down or to the right.
# You're also given a 0-1 array obs[][] of obstacles on the grid
# Find the number of distinct paths for the robot to get to the other end.


##             [x, y-1]
##              |
##  [x-1, y] ->[x,y]

def find_number_of_paths(obs)
# DP x,y => number of ways you can get to point [x][y] in the grid from [0][0]
# DPx,y = DPx-1,y + DPx,y-1 # provided no obstacles
#return num_of_distinct_paths
  #Solution DP[n-1][n-1]

  #DP[0][j] = 1 until you find an obstacle
  #DP[i][0] = 1 until you find an obstacle
  #DP[i][j] =
  # obs = multidimensional array, eg [[1,0,1], [0,1,0],[1,1,0]] => 3x3, n = 3
  n = obs.length
  return 0 if obs.nil? || obs.emtpy?

  dp = Array.new(n) { Array.new(n) }
  i = 0
  j = 0
  while (i<n)
    break if obs[0][i]
    dp[0][i] = 1
    i += 1
  end
  (i..n-1).each do |index| # once obstacle is hit, remaining in the first row would be zero
    dp[0][index] = 0
  end

  while (j<n)
    break if obs[j][0]
    dp[j][0] = 1
    j += 1
  end

  (j..n-1).each do |index| # once obstacle is hit, remaining in the first column would be zero
    dp[index][0] = 0
  end

  i = 1

  while (i < n)
    j = 1
    while(j<n)
      dp[i][j] = 0
      dp[i][j] = dp[i-i][j] + dp[i][j-i] unless obs[i][j]
      j += 1
    end
    i+=1
  end

  return dp[n-1][n-1]
end

# simple, without obstacles
# http://www.programcreek.com/2014/05/leetcode-unique-paths-java/

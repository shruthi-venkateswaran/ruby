# Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
#
# For example, given the array [−2,1,−3,4,−1,2,1,−5,4], the contiguous subarray [4,−1,2,1] has the largest sum = 6.

# below solution not just return max, but also makes it easy to find the subarray
# O(n)

def max_subarray(arr)
  p 'nothing to check' if arr.nil? || arr.empty?
  solution = [] #for each element, does that element exist in subarray with max value sum
  sum = [] # for each element, max sum upto that index if that element is included
  max = arr[0] # current max value
  sum[0] = arr[0] # for first element
  solution[0] = 1 # start with only first element being part of subarray
  i = 1

  while i < arr.length
    if arr[i] > arr[i] + sum[i-1]
      # current element is greater than max sum uptil now + max (previous sum is reducing max)
      # mark current element as max sum uptil now in sum[i]
      # make current element as max and it is the only one in the new subset
      # mark all previous elements as not in the subarray
      sum[i] = arr[i]
      solution[i] = 1
      (0..i-1).each do |index|
        solution[index] = 0 # prev elements, not in the subarray
      end

      max = arr[i]
    elsif arr[i] + sum[i-1] < max
      # current element does not increase max
      # current sum is max sum until now plus current element
      # current element is not in subset
      sum[i] = arr[i] + sum[i-1]
      solution[i] = 0
    elsif arr[i] + sum[i-1] > max
      # current element increases max
      # max sum uptil now plus current element is current max sum
      # max is current sum[i]
      # find the first previous element which was in the subarray, mark all elements between that and current element as present in subarray
      sum[i] = arr[i] + sum[i-1]
      max = sum[i]
      j = i-1
      while solution[j] != 1
        j -= 1
      end
      if j != -1
        (j..i).each do |index|
          solution[index] = 1
        end
      end
    end
    i += 1 # increment counter
  end

  puts "max = #{max}" #max value of subarray
  p solution # all elements marked as 1 in solution are the elements in the contiguous max subarray
end

if __FILE__ == $PROGRAM_NAME
  max_subarray([-2,1,-3,4,-1,2,1,-5,4])
  max_subarray([])
  max_subarray([1,2,3,4])
  max_subarray([3,2,1])
  max_subarray([-2, -3, 4, -1, -2, 1, 5, -3])
end

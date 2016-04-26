# Given an unsorted array nums, reorder it such that nums[0] < nums[1] > nums[2] < nums[3]....
#
# Example:
# (1) Given nums = [1, 5, 1, 1, 6, 4], one possible answer is [1, 4, 1, 5, 1, 6].
# (2) Given nums = [1, 3, 2, 2, 3, 1], one possible answer is [2, 3, 1, 3, 1, 2].
#

def wiggle_sort(arr) #lets assume arr is sorted, if not sort it
  return arr if arr.length <= 1
  l = arr.length
  if l%2 == 0
    mid = l/2
    left = arr[0..mid-1]
    right = arr[mid..l]
  else
    mid = (l-1)/2
    left = arr[0..mid]
    right = arr[mid+1..l] # right has one more than left if there are odd number of elements
  end

  i = left.length - 1
  j = right.length - 1

  solution = []

  while i >= 0 && j >= 0
    solution.push left[i]
    solution.push right[j]
    i -= 1
    j -= 1
  end

  while j >=0
    solution.push right[i]
    j -= 1
  end

  solution
end

if __FILE__ == $PROGRAM_NAME
  p wiggle_sort([1, 1, 1, 4, 5, 6])
  p '------------------'
  p wiggle_sort([1, 1, 2, 2, 3, 3])
  p '------------------'
  p wiggle_sort([])
  p '------------------'
  p wiggle_sort([1])
  p '------------------'
  p wiggle_sort([1,2])
  p '------------------'
  p wiggle_sort([1,2,3,5,5,5,6,7,8])
  p '------------------'
  p wiggle_sort([1,1,1,1,1,2,4,4,4])
end

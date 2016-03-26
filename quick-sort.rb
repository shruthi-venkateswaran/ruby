# QuickSort as we all know has a similar approach to Merge Sort i.e. it uses Divide-and-Conquer recursive algorithm to sort the values. The difference being is it's an in-place sorting algorithm.
#
#
# Basically an in-place algorithm is one which transforms the input using a data structure with a small, constant amount of extra storage space.
#
#
# Basic Idea of QuickSort
#
#
# 1. Pick an element in the array as the pivot element.
# => a. Normally we choose the first, last or the middle element as pivot. This can harm us badly as the pivot might end up to be the smallest or the largest element, thus leaving one of the partitions empty.
#    b. We should choose the Median of the first, last and middle elements.
# 2. Make a pass to the array, called the PARTITION step, which rearranges the elements in the array:
#    a. The pivot element is in the proper place
#     b. The elements less than pivot element are on the left of it
#     c. The elements greater than pivot element are on the right of it
# 3. Recursively apply the above process to the left and right part of the pivot element.
#
# Partitioning in the below implementation:
#
# a. First thing is to get the pivot => first element
#
# b. Now we want the elements greater than pivot to be on the right side of it and similarly the elements less than pivot to be on the left side of it.
#
# For this we define 2 pointers, namely i and j. i being at the first index + 1 and j being and the last index of the array.
#
#    * While i is less than j  we keep in incrementing i until we find an element greater than pivot.
#    * Similarly, while j is greater then i keep decrementing j  until we find an element less than pivot.
#    * After both i and j stop we swap the elements at the indexes of i and j respectively.
#
# At the end swap first element(pivot) with j => which is the actual index of the pivot and return that index
#

# http://codereview.stackexchange.com/questions/43667/quicksort-implementation

def sort(arr)
  if arr.nil? || arr.empty?
    puts 'Nothing to sort'
    return
  end
  quicksort(arr,0,arr.length-1)
  p arr
end

def quicksort(arr, left, right)
  if left<right
    pivot_index = partition(arr,left,right)
    quicksort(arr,left, pivot_index-1) if left < pivot_index
    quicksort(arr, pivot_index+1, right) if pivot_index < right
  end
end

def partition(arr,left,right)
  pivot = arr[right]
  current = left
  for i in current..right-1
    if arr[i] <= pivot
      arr[i], arr[current] = arr[current], arr[i]
      current += 1
    end
  end
  arr[current], arr[right] = arr[right], arr[current]
  return current
end

if __FILE__ == $PROGRAM_NAME
  sort([5,6,3,4,11,8])
  sort(nil)
  sort([])
  sort([1,2,3,4])
  sort([5,3,2,1])
  sort([45,22,33,8,1,9,0,44,87,1])
end

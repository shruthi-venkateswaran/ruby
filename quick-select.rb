# return the kth smallest item
#
def select(arr, k)
  if arr.nil? || arr.empty? || k > arr.length
    puts 'Nothing to select'
    return
  end
  p quick_select(arr, 0, arr.length-1, k)
end

def quick_select(arr, left, right, k)
    pivot_index = partition(arr,left,right)
    return arr[pivot_index] if pivot_index == k-1
    return quick_select(arr,left, pivot_index-1, k) if pivot_index > k-1
    return quick_select(arr, pivot_index+1, right, k)
end

def partition(arr,left,right)
  pivot = arr[right]
  current = left
  for i in left..right-1
    if arr[i] <= pivot
      arr[i], arr[current] = arr[current], arr[i]
      current += 1
    end
  end
  arr[current], arr[right] = arr[right], arr[current]
  return current
end

if __FILE__ == $PROGRAM_NAME
  select([5,6,3,4,11,8], 1)
  select(nil, 3)
  select([], 5)
  select([1,2,3,4], 6)
  select([5,3,2,1], 4)
  select([45,22,33,8,1,9,0,44,87,1], 10)
end

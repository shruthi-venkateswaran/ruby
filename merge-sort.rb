#TODO

def merge(arr1,arr2)
  merged_arr = []
  i = 0
  j = 0
  while (i < arr1.length && j < arr2.length)
    if arr1[i] <= arr2[j]
      merged_arr.push(arr1[i])
      i +=1
    else
      merged_arr.push(arr2[j])
      j += 1
    end
  end

  while (i < arr1.length)
    merged_arr.push(arr1[i])
    i +=1
  end

  while (j < arr2.length)
    merged_arr.push(arr2[j])
    j +=1
  end

  merged_arr
end

def merge_sort(arr)
  return arr if arr.nil? || arr.length <= 1
  mid = arr.length/2
  left = arr[0,mid]       # arr[0,0] => [], hence return arr if length is 1 too
  right = arr[mid,arr.length] # need to start with mid, as it is not inclusive in left
  merge(merge_sort(left), merge_sort(right))
end

if __FILE__ == $PROGRAM_NAME
  p merge_sort([4,2,6,8,0,1,3,8,9])
end

# The median of a dataset of integers is the midpoint value of the dataset for which an equal number of integers are less than and greater than the value. To find the median, you must first sort your dataset of integers in non-decreasing order, then:
#
# If your dataset contains an odd number of elements, the median is the middle element of the sorted sample. In the sorted dataset ,  is the median.
# If your dataset contains an even number of elements, the median is the average of the two middle elements of the sorted sample. In the sorted dataset ,  is the median.
# Given an input stream of  integers, you must perform the following task for each  integer:
#
# Add the  integer to a running list of integers.
# Find the median of the updated list (i.e., for the first element through the  element).
# Print the list's updated median on a new line. The printed value must be a double-precision number scaled to decimal place (i.e.,  format).

def left(index)
  2*index + 1
end
def right(index)
  2*index + 2
end

def max_heapify(heap, index)
  right_child = right(index)
  left_child = left(index)

  if left_child < heap.size && heap[left_child] > heap[index]
    largest = left_child
  else
    largest = index
  end

  if right_child < heap.size && heap[right_child] > heap[largest]
    largest = right_child
  end

  if largest!= index
    heap[index], heap[largest] = heap[largest], heap[index]
    max_heapify(heap, largest)
  end
end

def min_heapify(heap, index)
  right_child = right(index)
  left_child = left(index)

  if left_child < heap.size && heap[left_child] < heap[index]
    smallest = left_child
  else
    smallest = index
  end

  if right_child < heap.size && heap[right_child] < heap[smallest]
    smallest = right_child
  end

  if smallest!= index
    heap[index], heap[smallest] = heap[smallest], heap[index]
    min_heapify(heap, smallest)
  end
end

if __FILE__ == $PROGRAM_NAME
  min_heap = []
  max_heap = []
  count = 0
  n = gets.strip.to_i
  n.times do
    a = gets.strip.to_i
    count += 1
    if count == 1
      max_heap.push(a)
      puts a.to_f.round(1)
      next
    end

    if min_heap.length == max_heap.length
      if a < max_heap[0]
        max_heap = [a] + max_heap
        max_heapify(max_heap, 0)
        puts max_heap[0].to_f.round(1)
      else
        min_heap = [a] + min_heap
        min_heapify(min_heap, 0)
        puts min_heap[0].to_f.round(1)
      end
      next
    end

    if min_heap.length < max_heap.length
      if a < max_heap[0]
        min_heap = [max_heap[0]] + min_heap
        min_heapify(min_heap, 0)
        max_heap[0] = a
        max_heapify(max_heap, 0)
      else
        min_heap = [a] + min_heap
        min_heapify(min_heap, 0)
      end
      puts ((max_heap[0]+min_heap[0])/2.0).to_f.round(1)
      next
    end

    if min_heap.length > max_heap.length
      if a < max_heap[0]
        max_heap = [a] + max_heap
        max_heapify(max_heap, 0)
      else
        max_heap = [min_heap[0]] + max_heap
        max_heapify(max_heap, 0)
        min_heap[0] = a
        min_heapify(min_heap, 0)
      end
      puts ((max_heap[0]+min_heap[0])/2.0).to_f.round(1)
      next
    end
  end
end

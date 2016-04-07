# http://www.sitepoint.com/heap-data-structure-ruby/

class Heap
  attr_accessor :heap_size, :array_rep
  def left_child_index(index)
    2*index + 1
  end

  def right_child_index(index)
    2*index + 2
  end

  def max_heapify(index)
    l = left_child_index(index)
    r = right_child_index(index)

    if l < @heap_size && @array_rep[l] > @array_rep[index]
      largest = l
    else
      largest = index
    end

    if r < @heap_size && @array_rep[r] > @array_rep[largest]
      largest = r
    end

    if largest != index
      @array_rep[index], @array_rep[largest] = @array_rep[largest], @array_rep[index]
      max_heapify(largest)
    end
  end

  def build_max_heap
    # i = ((@array_rep.length).to_f/2.to_f).floor
    @heap_size = @array_rep.length
    i = (@heap_size-1)/2
    while i >= 0
      max_heapify(i)
      i -=1
    end
  end

  def heap_sort
    # Forming max heap, pushing array_rep[0] to end at every stage
    build_max_heap
    i = @heap_size
    while i>0
      @array_rep[0], @array_rep[@heap_size - 1] = @array_rep[@heap_size - 1], @array_rep[0]
      @heap_size -= 1
      max_heapify(0)
      i -= 1
    end

    @heap_size = @array_rep.length # reset heap size to actual array length
  end
end

if __FILE__ == $PROGRAM_NAME
  heap = Heap.new
  heap.array_rep = [2,4,5,8,7,43,6,78,2,0,9]
  heap.build_max_heap
  p heap.array_rep
  heap.heap_sort
  p heap.array_rep
end

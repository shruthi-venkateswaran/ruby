# http://www.sitepoint.com/heap-data-structure-ruby/

class Heap
  attr_accessor :array_rep
  def left_child_index(index)
    2*index + 1
  end

  def right_child_index(index)
    2*index + 2
  end

  def max_heapify(index)
    l = left_child_index(index)
    r = right_child_index(index)

    if l <= @array_rep.length && @array_rep[l] > @array_rep[index]
      largest = l
    else
      largest = index
    end

    if r <= @array_rep.length && @array_rep[r] > @array_rep[largest]
      largest = r
    end

    @array_rep[index], @array_rep[largest] = @array_rep[largest], @array_rep[index] if largest != index
    max_heapify(largest)
  end

  def build_max_heap
    p @array_rep
    i = @array_rep.length/2 - 1
    while i > 0
      max_heapify(i)
      i -=1
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  heap = Heap.new()
  heap.array_rep = [2,4,5,8,7]
  heap.build_max_heap
  p heap.array_rep
end

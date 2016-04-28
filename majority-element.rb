# which element of a sequence is in the majority, provided there is such an element
# A Linear Time Majority Vote Algorithm

def majority_vote(arr)
  maj_index = 0
  count = 1

  (0..arr.length-1).each do |i|

    if(count == 0)
      maj_index = i
      count = 1
    elsif (arr[maj_index] == arr[i])
        count += 1
    else
      count -= 1
    end

  end

  arr[maj_index]
end

if __FILE__ == $PROGRAM_NAME
  p majority_vote([1,2,3,2,5])
end

#majority only if it exists, an element present for >= half of the total

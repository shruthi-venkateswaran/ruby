def pascals_triangle(k)
  pascals_array = []
  for i in 0..k-1 do
    pascals_array[i] = []
    pascals_array[i].push(1)
    next if i == 0
    if i == 1
      pascals_array[i].push(1)
      next
    end

    j = 1
    while j<= pascals_array[i-1].length-1
      pascals_array[i].push(pascals_array[i-1][j] + pascals_array[i-1][j-1])
      j += 1
    end
    pascals_array[i].push(1)
  end

  pascals_array.each do |line|
    puts line.join(' ')
  end
end

if __FILE__ == $PROGRAM_NAME
  pascals_triangle(4)
  puts '----------------'
  pascals_triangle(10)
  puts '----------------'
  pascals_triangle(1)
  puts '----------------'
  pascals_triangle(2)
  puts '----------------'
  pascals_triangle(0)
  puts '----------------'
  pascals_triangle(20)
end

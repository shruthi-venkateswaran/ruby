
# saddle point in a matrix is the cell value
# which is the largest in that row and smallest in that column

def saddle_point(matrix)
  0.upto(matrix.row_count - 1) do |row_num|
    row = matrix.row(row_num)
    column_num = row.find_index(row.max)
    column = matrix.column(column_num)
    if column.find_index(column.min) == row_num
      sp = matrix.element(row_num, column_num)
      puts "Found saddle point = #{sp}"
      return
    end
  end
  p 'No saddle point found'
end

require 'matrix'

if __FILE__ == $PROGRAM_NAME
  #m = Matrix[ [1,4,5], [3,6,8], [0,8,2] ]
  #m = Matrix[[4,5,4] , [3,5,5] , [1,5,4]]
  m = Matrix[[1,2], [2,1]]
  puts m
  saddle_point(m)
end

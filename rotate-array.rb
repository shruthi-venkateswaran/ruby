#Rotate array by X places
# 1,2,3 -> rotate by 2 => 3,1,2
#
def rotate_array(given_array, order)
  temp_array = []

  for i in 0..given_array.length-1
    index = (i + order) % given_array.length
    temp_array[index] = given_array[i]
  end

  p temp_array
end

def rotate_array1(given_array, order)
  order = order % given_array.length
  fail 'Invalid input' if given_array.nil? || order < 0

  a = given_array.length - order
  reverse(given_array, 0 , a-1)
  reverse(given_array, a , given_array.length-1)
  reverse(given_array, 0 , given_array.length-1)
  p given_array
end

def reverse(arr, left, right)
  return if arr.nil? || arr.length ==1
  while left < right do
    temp = arr[left]
    arr[left] = arr[right]
    arr[right] = temp
    left = left + 1
    right =  right - 1
  end
end

if __FILE__ == $PROGRAM_NAME
  puts 'Enter array'
  array = []
  input = ' '
  while input != '' do
      input = gets.chomp
        array.push input
  end
  p array
  rotate_array(array,5)
  rotate_array1([1,2,3,4,5,6,7,8], 4)
end

# Given an array  with random 0s and non-zero numbers, shift all zeroes to the beginning and non-zero numbers to the rear
# Ex: 1,9,8,4,0,0,2,7,0,6,0
# Ouput: 0,0,0,0,1,9,8,4,2,7,6
#
# Order of numbers should not change. Do it in place

def rearrange_without_order(arr)
   if arr.nil? || arr.empty?
     puts 'Array empty'
     return
   end
   current = 0

   for i in 0..arr.length-1
     if arr[i] == 0
       arr[current], arr[i] = arr[i], arr[current] if arr[current] !=0
       current += 1
     end
   end
  p arr
end

def rearrange_with_order(arr)
   if arr.nil? || arr.empty?
     puts 'Array empty'
     return
   end
   final_arr = []
   current = arr.length-1
   zero_count = 0
   while current >=0
     if arr[current] == 0
       zero_count += 1
     else
       final_arr.push(arr[current])
     end
     current -=1
   end
   zero_count.times do
     final_arr.push(0)
   end
  p final_arr.reverse
end

if __FILE__ == $PROGRAM_NAME
  rearrange_without_order([])
  rearrange_without_order(nil)
  rearrange_without_order([1,9,8,4,0,0,2,7,0,6,0])
  rearrange_with_order([1,9,8,4,0,0,2,7,0,6,0])
end

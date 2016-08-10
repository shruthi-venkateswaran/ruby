def modified_binary_search(arr, target)
  return false if arr.nil? || arr.empty?
  find_number(arr, target, 0, arr.length - 1)
end

def find_number(arr, target, start_index, end_index)
  while end_index >= start_index
    mid = start_index + (end_index - start_index) / 2 # odd length?
    return true if arr[mid] == target
    if arr[start_index] <= arr[mid] # left half is still sorted
      if target >= arr[start_index] && target < arr[mid]
        end_index = mid - 1
      elsif target >= arr[start_index] && target > arr[mid]
        start_index = mid + 1
      else
        start_index = mid + 1
      end
    else # right half is sorted
      if target <= arr[start_index] && target < arr[mid]
        end_index = mid - 1
      elsif target <= arr[start_index] && target > arr[mid]
        start_index = mid + 1
      else
        end_index = mid - 1
      end
    end
  end
  false
end

if __FILE__ == $PROGRAM_NAME
  puts modified_binary_search([6, 7, 1, 2, 3, 4, 5], 7)
  puts modified_binary_search([6, 7, 1, 2, 3, 4, 5], 4)
  puts modified_binary_search([6, 7, 1, 2, 3, 4, 5], 9)
  puts modified_binary_search([2,3,4,5,6,7,0,1], 7)
end

# string to integer

# "123" => 123
# "-123" => -123
# "abc123" => throw exception
# "12.3"
# => throw exception
# def string_to_integer(str)
#     char = str.chars
#     start = 0
#     negative = false
#     if char[0] == '-'
#         start = 1
#         negative = true
#     end
#
#     sum = 0
#
#     final = []
#     (start..str.length-1).each do | c |
#         if is_number?(c)
#             sum = sum*10 + numeric(c)
#         else
#             fail "#{str} cannot be converted to integer" # throwing exception
#         end
#      end
#
#     final_string = final.join('') => '123'
#     if negative
#         return sum * -1 # integer
#     else
#        return sum # integer
#     end
# end
#
# def is_number?(tochar)
#     ascii = char.ord #ascii value
#     if ascii >= 49 && ascii <= 58
#         return true
#     else
#         return false
#     end
# end
# 'wyx'.to_i => 0
#
#
# --------------

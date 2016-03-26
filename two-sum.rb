# Given and array of numbers and a target, print index of two numbers if they
# add upto the target
#

def two_sum(arr, target)
  map = {}
  index = 0
  arr.each do |x|
    if map[target-x]
      puts "We have found the two numbers that add upto #{target}"
      puts "first number is #{x} at index #{index}"
      puts "second number is #{target-x} at index #{map[target-x]}"
      exit
    end
    map[x] = index
    index += 1
  end
end

if __FILE__ == $PROGRAM_NAME
  arr = [1,3,4,5,6,7,2,4,5,9,45,56,778,56446,889,78,533,22,1,5,7,8,6,3,6,7,7,3,5556,4]
  target = 5560
  two_sum(arr, target)
end


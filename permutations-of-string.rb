#print all permutations of a string

def print_char_permutations(char_array)
 puts char_array.permutation.map &:join
end

def string_permutations(str)
  puts "string is = #{str}"
  return if str.nil? || str.empty?
  chars = str.chomp.chars
  print_char_permutations(chars)
  return if str.length == 1
  # rotated_array = chars
  # p "chars = #{chars}"
  str.length.times do
    # rotated_array = rotated_array.rotate
    # p "rotated_array = #{rotated_array}"
    # r = rotated_array
    # r.pop
    chars.rotate
    chars.pop
    string_permutations(chars.join)
  end
end

if __FILE__ == $PROGRAM_NAME
  puts 'Enter String:'
  string = gets
  puts
  string_permutations(string)
end

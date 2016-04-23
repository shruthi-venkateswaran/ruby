#print all permutations of a string

def print_char_permutations(char_array)
 puts char_array.permutation.map &:join
end

def string_permutations(str)
  return if str.nil? || str.empty?
  chars = str.chomp.chars
  print_char_permutations(chars)
  return if str.length == 1
  str.length.times do
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

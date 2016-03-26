#print all sequences in a string
# Eg: eghhi =< e,g,hh,i
def print_sequence(input_str)
  0.upto(input_str.length - 1) do |i|
    print input_str[i]
    if input_str[i+1] && (input_str[i+1]!= input_str[i])
      puts ';'
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Enter string"
  str = gets
  print_sequence(str)
end

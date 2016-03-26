# implement ruby gsub
#
def find_replace(orig_str, target, replace_with)
  orig_chars = orig_str.chars
  target_chars = target.chars
  final_string = []
  i = 0
  while i < orig_str.length
    if orig_chars[i] != target_chars[0] #keep pushing until match is not found
      final_string.push(orig_chars[i])
      i += 1
    else #first letter match found
      start_index = i
      end_index = i
      k = 0
      while k < target_chars.length
        if orig_chars[i] == target_chars[k] #keep checking till it matches
          i += 1
          k += 1
          end_index = i
        else
          break
        end
      end
      if k == target_chars.length #we have a full string match
        replace_with.chars.each do |char|
          final_string.push(char) #push substitute string into new one
        end
      else # we dont have full string match, so add same chars as is
        (start_index..end_index).each do |index|
          final_string.push(orig_chars[index])
        end
      end
    end
  end

   puts 'Final string is :'
   puts final_string.join('')
end

if __FILE__ == $PROGRAM_NAME
  find_replace('tgtfjytuyuggggjkhlgfdhggggmklgjlkfjg', 'gggg', 'rrrr')
end

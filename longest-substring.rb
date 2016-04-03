# Given a string, find the length of the longest substring without repeating characters.
# For example, the longest substring without repeating letters for "abcabcbb" is "abc", which the length is 3.
# For "bbbbb" the longest substring is "b", with the length of 1.
# lolswrc - length of the longest substring without repeating characters
# lswrc - longest substring without repeating characters (return the actual substring)

def lolswrc(str)
  map = {}
  i = 0
  start = 0
  str_chars = str.chars
  result = 0
  while i < str_chars.length
    if !map[str_chars[i]]
      map[str_chars[i]] = i
    else
      result = result > (i-start) ? result : (i-start) # current longest
      prev_pos = map[str_chars[i]] # where did we previously find the repeated character
      start = prev_pos + 1 # start after the repeated character
      map[str_chars[i]] = i # update the new position for the repeated character
    end
    i += 1
  end

  result = result > (i-start) ? result : (i-start) # need to check one more time because we dont check after last char, if we go into if block
  result
end

def lswrc(str)
  map = {}
  i = 0
  start = 0
  str_chars = str.chars
  result = 0
  while i < str_chars.length
    if !map[str_chars[i]]
      map[str_chars[i]] = i
    else
      if result < i-start
        result = i-start
        longest_subsequence = str[start..i-1]
      end
      prev_pos = map[str_chars[i]] # where did we previously find the repeated character
      start = prev_pos + 1 # start after the repeated character
      map[str_chars[i]] = i # update the new position for the repeated character
    end
    i += 1
  end

  if result < i-start
    result = i-start
    longest_subsequence = str[start..i-1]
  end
  longest_subsequence
end

if __FILE__ == $PROGRAM_NAME
  p lolswrc('abcabcbb')
  p lolswrc('bbbbb')
  p lolswrc('abcbde')

  p lswrc('abcabcbb')
  p lswrc('bbbbb')
  p lswrc('abcbde')
end

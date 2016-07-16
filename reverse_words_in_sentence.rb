def reverse_word(word)
  n = word.length
  start_index = 0
  end_index = n-1
  while start_index < end_index
    tmp = word[start_index]
    word[start_index] = word[end_index]
    word[end_index] = tmp
    start_index += 1
    end_index -= 1
  end
  word
end

def reverse_words_in_sentence(sentence)
  words = sentence.split(' ')
  reverse = []
  words.each do |word|
    # reverse.push(word.reverse)
    reversed_word = reverse_word(word)
    reverse.push(reversed_word)
  end
  reverse.join(' ')
end

def reverse_sentence_preserve_capital_positions(sentence)
  words = sentence.split(' ')
  reverse = []
  words.each do |word|
    if ('A'..'Z').include? word[0]
      reversed_word = word.reverse
      reversed_word[0] = reversed_word[0].upcase
      reversed_word[reversed_word.length - 1] = reversed_word[reversed_word.length - 1].downcase
      reverse.push(reversed_word)
    else
      reverse.push(word.reverse)
    end
  end

  reverse.join(' ')
end

if __FILE__ == $PROGRAM_NAME
  a = 'Hello how are You?'
  puts reverse_words_in_sentence(a)
  puts reverse_sentence_preserve_capital_positions(a)
end

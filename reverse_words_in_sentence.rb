
def reverse_words_in_sentence(sentence)
  words = sentence.split(' ')
  reverse = []
  words.each do |word|
    reverse.push(word.reverse)
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

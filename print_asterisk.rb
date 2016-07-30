## This is the text editor interface.
## Anything you type or change here will be seen by the other person in real time.

# string input

# "test me there"
# empty or nil => print nothing
# formatted correclty, valid string
#   *
# * *
# * *
# ***
# ***


def print_asterisk(str)
    return if str.nil? || str.empty?

    words = str.split(' ') # split the sentence into words

    words.each do |word|
        len_of_word = word.length
        len_of_word.times do
            print '*'
        end
        puts
    end
end

def print_asterisk_vertically(str)
    return if str.nil? || str.empty?

    words = str.split(' ') # split the sentence into words ['test']
    max_word_length = util(words) # TODO # 4
    final_table = Array.new(max_word_length) { Array.new(words.length) } []
                                                                         []
    i = 0

    while i < words.length
      # i is the index, which represent the column in the table
      j = max_word_length - 1
      current_word = words[i]
      current_word_length = current_word.length # 4
      current_word_length.times do
        final_table[j][i] = '*'
        j -= 1
      end
      i += 1
    end

    printUtil(final_table)
end

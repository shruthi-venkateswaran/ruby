#Trie
#assuming it's a dictionary of alls small letter words

class TrieNode
  attr_accessor :prefix_count, :is_end, :children
  def initialize
    @prefix_count = 0
    @is_end = false
    @children = [] #array of upto 26 objects(one per alphabet letter) (each is a pointer to another trie node indicating that letter exists)
  end
end

class Trie
  attr_accessor :head
  def initialize
    @head = TrieNode.new
  end

  def insert_word(word)
    word_chars = word.chars
    current = @head
    current.prefix_count += 1
    for i in 0..word.length-1 do
      letter = word_chars[i].ord - 'a'.ord
      current.children[letter] = TrieNode.new if current.children[letter].nil?
      current.children[letter].prefix_count += 1
      current = current.children[letter]
    end
    current.is_end = true
  end

  def search_word(word)
    word_chars = word.chars
    current = @head
    for i in 0..word.length-1 do
      letter = word_chars[i].ord - 'a'.ord
      return false if current.children[letter].nil?
      current = current.children[letter]
    end
    return current.is_end
  end

  def words_with_prefix(prefix) #count words with prefix
    prefix_chars = prefix.chars
    current = @head
    for i in 0..prefix.length-1 do
      return 0 if current.children[letter].nil?
      current = current.children[letter]
    end
    return current.prefix_count
  end
end

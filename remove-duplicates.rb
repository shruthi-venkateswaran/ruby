# an algorithm and write code to remove the duplicate characters
#
def remove_duplicates(str)
  d = str.chars
  hit = []
  uniq = []
  d.each do |char|
   next if  hit[char.ord]
   uniq.push(char)
   hit[char.ord] = 1
  end

  uniq.join('')
end

if __FILE__ == $PROGRAM_NAME
  d = 'ldkfldkfarff jnfkjn alskdl'
  p remove_duplicates(d)
end

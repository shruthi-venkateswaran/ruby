#http://algorithms.tutorialhorizon.com/colorful-numbers/
# check if a number is colorful

def reverse_num(num)
  int rev = 0
  while num > 0
    rev = rev*10 + (num%10)
    num = num / 10
  end
  rev
end

def isColorful?(num)
  digits = []
  a = num
  while a>0
    a,b = a.divmod(10)
    return false if b == 0
    return false if digits.include?(b) #duplicate digit
    digits.push(b)
  end
  digits = digits.reverse
  products = digits

  0.upto(digits.length-2) do |i|
    p = digits[i] * digits[i+1]
    return false if products.include?(p)
    products.push(p)
  end

  return true
end

if __FILE__ == $PROGRAM_NAME
  puts 'Enter number:'
  num = gets
  if isColorful?(num.to_i)
    puts 'Number is colorful'
  else
    puts 'Number is not colorful'
  end
end

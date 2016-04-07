# cannot pick from adjacent, maximize treasure that can be picked from treasure
# drawers
#
def max_between(a,b)
  a > b ? a : b
end

def max_treasure(treasure_values)
  return 0 if treasure_values.nil? || treasure_values.empty?
  if treasure_values.length == 2
    return max_between(treasure_values[0],treasure_values[1])
  end
  max = []
  n = treasure_values.length
  max[0] = 0
  max[1] = treasure_values[0]
  2.upto(n) do |i|
    max[i] = max_between(max[i-1], max[i-2]+treasure_values[i-1])
  end
  max[n]
end

if __FILE__ == $PROGRAM_NAME
  a = [1,0,3,3,5]
  p max_treasure(a)
end

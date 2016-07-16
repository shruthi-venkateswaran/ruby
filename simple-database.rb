# Class to implement Simple Database
# This approach uses two main hashes:
# - one is a simple key-value store for all permanent transactions => @key_value_map
# - one is an inverse index hash of total variable count for a given value => @num_equal_to_map
# It also uses a mantains a list of ongoing transactions(each transaction is much less than variable count) => @transaction_key_value_map_array
# Each ongoing transaction is a key-value map

class SimpleDatabase
  attr_accessor :key_value_map,
                :num_equal_to_map,
                :transaction_key_value_map_array,
                :current_transaction_count, # number of ongoing transaction blocks
                :transaction_num_equal_to_map # for NUMEQUALTO to track values including the given transaction

  def initialize
    @key_value_map = {}
    @num_equal_to_map = {}
    @transaction_key_value_map_array = []
    @current_transaction_count = 0
    @transaction_num_equal_to_map = {}
  end

  def parse_command(current_command)
    case current_command[0]
    when 'BEGIN'
      do_begin
    when 'GET'
      do_get(current_command[1])
    when 'SET'
      do_set(current_command[1], current_command[2])
    when 'UNSET'
      do_unset(current_command[1])
    when 'NUMEQUALTO'
      do_numequalto(current_command[1])
    when 'COMMIT'
      do_commit
    when 'ROLLBACK'
      do_rollback
    end
  end

  private

  def do_begin
    @current_transaction_count += 1
    @transaction_key_value_map_array.push({}) # add to the list of ongoing transactions
  end

  def do_get(key)
    value = nil
    unset = false
    if @current_transaction_count > 0 # ongoing transaction, get the most current set value
      current_transaction_map = @transaction_key_value_map_array.length - 1
      while current_transaction_map >= 0 # find the last set value in a given transaction
        if @transaction_key_value_map_array[current_transaction_map][key]
          value = @transaction_key_value_map_array[current_transaction_map][key].last
          break
        end
        # if a variable was unset, no need to check previous transactions for the value
        if @transaction_key_value_map_array[current_transaction_map]["#{key}_unset"]
          unset = true
          break
        end
        current_transaction_map -= 1
      end
      value = @key_value_map[key] if value.nil? && !unset
    else # no ongoing transaction
      value = @key_value_map[key]
    end

    if value.nil?
      puts '> NULL'
    else
      puts "> #{value}"
    end
  end

  def do_set(key, value)
    if @current_transaction_count > 0 # ongoing transaction, set in the current_transaction key-value map
      current_transaction_map = @transaction_key_value_map_array.last
      if !current_transaction_map[key].nil?
        current_transaction_map[key].push(value)
      else
        current_transaction_map[key] = [value]
      end
      current_transaction_map.delete("#{key}_unset")
    else # no ongoing transaction
      set(key, value)
    end
  end

  def do_unset(key)
    if @current_transaction_count > 0 # ongoing transaction, track unsetting of this variable
      current_transaction_map = @transaction_key_value_map_array.last
      current_transaction_map.delete(key) if current_transaction_map[key]
      current_transaction_map["#{key}_unset"] = true
    else # no ongoing transaction, unset from original key-value map
      unset(key)
    end
  end

  def do_numequalto(number)
    total = 0

    if @current_transaction_count > 0 # ongoing transaction
      current_transaction_map = @transaction_key_value_map_array.length - 1
      while current_transaction_map >= 0
        @transaction_key_value_map_array[current_transaction_map].each do |key, value|
          if key.include?('unset') # if variable was unset, don't count any occurence of it with this given value
            unset_key = key.match(/(.*)_unset/)[1]
            @transaction_num_equal_to_map[unset_key] = false
          elsif value.last == number && @transaction_num_equal_to_map[key].nil?
            total += 1
            @transaction_num_equal_to_map[key] = true
          end
        end
        current_transaction_map -= 1
      end

      # if variable was not unset but exists in original map, count it
      @key_value_map.each do |key, value|
        if value == number
          total += 1 if @transaction_num_equal_to_map[key].nil?
        end
      end
    else # no ongoing transaction
      total += @num_equal_to_map[number] unless @num_equal_to_map[number].nil?
    end

    puts "> #{total}"
  end

  def do_commit
    if @current_transaction_count > 0 # ongoing transaction, commit all values to original map
      @transaction_key_value_map_array.each do |hash|
        hash.each do |key, value_array|
          if key.include?('unset')
            @key_value_map.delete(key)
          else
            @key_value_map[key] = value_array.last
          end
        end
      end
      @current_transaction_count = 0
      @transaction_key_value_map_array = []
      @transaction_num_equal_to_map = {}
    else
      puts '> NO TRANSACTION'
    end
  end

  def do_rollback
    if @current_transaction_count > 0 # remove most recent transaction from the list
      @transaction_key_value_map_array.pop
      @current_transaction_count -= 1
      @transaction_num_equal_to_map = {}
    else
      puts '> NO TRANSACTION'
    end
  end

  def set(key, value)
    current_value = @key_value_map[key]
    @key_value_map[key] = value

    if !@num_equal_to_map[value].nil?
      @num_equal_to_map[value] += 1
    else
      @num_equal_to_map[value] = 1
    end

    if !current_value.nil? && !@num_equal_to_map[current_value].nil? && @num_equal_to_map[current_value] > 0
      @num_equal_to_map[current_value] -= 1
    end
  end

  def unset(key)
    value = @key_value_map[key]
    @key_value_map.delete(key)

    # if value is nil, key was not set at all, no need to unset
    return if value.nil?

    if !@num_equal_to_map[value].nil? && @num_equal_to_map[value] > 0
      @num_equal_to_map[value] -= 1
    else
      @num_equal_to_map[value] = 0
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  sb = SimpleDatabase.new
  command_line = gets.chomp
  # read each line of input from STDIN
  while command_line != 'END'
    puts command_line
    command = command_line.split(' ')
    sb.parse_command(command)
    command_line = gets.chomp
  end

  puts 'END' if command_line == 'END'
end

# Class to implement Simple Database
class SimpleDatabase
  attr_accessor :key_value_map, :num_equal_to_map, :transaction_key_value_map_array, :transaction_num_equal_to_map, :current_transaction_count

  def initialize
    @current_transaction_count = 0
    @key_value_map = {}
    @num_equal_to_map = {}
    @transaction_key_value_map_array = []
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
    @transaction_key_value_map_array.push({})
  end

  def do_get(key)
    value = nil
    if @current_transaction_count > 0
      current_transaction_map = @transaction_key_value_map_array.length - 1
      while(current_transaction_map >= 0)
        if @transaction_key_value_map_array[current_transaction_map][key]
          value = @transaction_key_value_map_array[current_transaction_map][key].last
          break
        end
        current_transaction_map -= 1
      end
      value = @key_value_map[key] if value.nil?
    else
      value = @key_value_map[key]
    end

    if value.nil?
      puts '> NULL'
    else
      puts "> #{value}"
    end
  end

  def do_set(key, value)
    if @current_transaction_count > 0
      current_transaction_map = @transaction_key_value_map_array.last
      if !current_transaction_map[key].nil?
        current_transaction_map[key].push(value)
      else
        current_transaction_map[key] = [value]
      end
    else
      set(key,value)
    end
  end

  def do_unset(key)
    if @current_transaction_count > 0
      current_transaction_map = @transaction_key_value_map_array.last
      current_transaction_map.delete(key) if current_transaction_map[key]
    else
      unset(key)
    end
  end

  def do_numequalto(number)
    if @num_equal_to_map[number].nil?
      puts '> 0'
    else
      puts "> #{@num_equal_to_map[number]}"
    end
  end

  def do_commit
    if @current_transaction_count > 0
      @transaction_key_value_map_array.each do |hash|
        hash.each do |key, value_array|
          @key_value_map[key] = value_array.last
        end
      end
      @current_transaction_count = 0
      @transaction_key_value_map_array = []
    else
      puts '> NO TRANSACTION'
    end
  end

  def do_rollback
    if @current_transaction_count > 0
      @transaction_key_value_map_array.pop
      @current_transaction_count -= 1
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

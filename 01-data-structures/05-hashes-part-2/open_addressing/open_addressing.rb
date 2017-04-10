require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    if(@items[index(key, @items.length)]&& next_open_index(index(key, @items.length)))
      @items[next_open_index(index(key, @items.length))] = Node.new(key, value)
    elsif (@items[index(key, @items.length)]&& !next_open_index(index(key, @items.length)))
      resize
      self.[]=(key, value)
      return
    else
      @items[index(key, @items.length)] = Node.new(key,value)
    end
  end

  def [](key)#Fix if same code but wrong key
    if (@items[index(key, @items.length)])
      return @items[index(key, @items.length)].value
    else
      return false
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    key.each_byte do |c|
      sum += c
    end
    return (sum) % (size)
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    for i in index...size
      if (!@items[i])
        return i
      end
    end
    return false
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

  # Resize the hash
  def resize
    temp = @items
    new_size = 2*temp.length
    @items = Array.new(new_size)
     temp.each{|item|
     if (item)
       i = index(item.key, new_size)
       @items[i] = Node.new(item.key, item.value)
     end
     }
  end

  def print
    count = 0
    @items.each {|x|
      if (x)
        count+=1;
        puts "Key: #{x.key} ... Value: #{x.value}"
      else
        puts "Empty Box"
      end
      puts "____________________"
    }
    puts "Load Factor: #{count/size.round(2)}"
  end
end

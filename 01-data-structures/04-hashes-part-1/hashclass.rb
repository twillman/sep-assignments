class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    if (@items[index(key, @items.length)] && (@items[index(key, @items.length)].value!=value))
      resize
    elsif (@items[index(key, @items.length)] && (@items[index(key, @items.length)].value==value))
      return
    else
      @items[index(key, @items.length)] = HashItem.new(key, value)
    end
  end


  def [](key)
    if (@items[index(key, @items.length)])
      return @items[index(key, @items.length)].value
    else
      return false
    end
  end

  def resize
    temp = @items
    new_size = 2*temp.length
    @items = Array.new(new_size)
     temp.each{|item|
     if (item)
       i = index(item.key, new_size)
       @items[i] = HashItem.new(item.key, item.value)
     end
     }
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

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

end

require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    length=0

    if (!@items[index(key, @items.length)])
      @items[index(key, @items.length)] = LinkedList.new()
    end

    current = @items[index(key, @items.length)].head

    while (current)
      if (current.key == key)
         current.value = value
         return
      end
      length+=1
      current = current.next
    end

    if (length < size)
      @items[index(key, @items.length)].add_to_tail(Node.new(key,value))
      if (load_factor>max_load_factor)
        resize
      end
    else
      resize
    end
  end

  def [](key)
      current = @items[index(key, @items.length)].head
      while (current && current.key != key)
        current = current.next
      end
      if (current && current.key == key)
        return @items[index(key, @items.length)].head.value
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

  # Calculate the current load factor
  def load_factor
    total = 0
    @items.each { |x|
      if (x)
        current =x.head
        while (current)
          total+=1
          current = current.next
        end
      end
    }
    return total/size.round(2)
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
     temp.each{|list|
     if (list)
       current = list.head
       while (current != nil)
        i = index(current.key, new_size)
        if (!@items[i])
           @items[i] = LinkedList.new()
        end
        @items[i].add_to_tail(Node.new(current.key, current.value))
        current = current.next
       end
     end
     }
  end
end

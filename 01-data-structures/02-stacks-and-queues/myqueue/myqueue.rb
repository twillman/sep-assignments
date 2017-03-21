class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    self.tail = @queue[0]
    @h=-1
    @t=0
  end

  def enqueue(element)
    @h += 1
    @queue[@h] = element
    @head = @queue[@h]
    self.tail = @queue[@t]
  end

  def dequeue
    temp = @queue[@t]
    if (!empty?)
      @t += 1
      self.tail = @queue[@t]
    else
      self.tail = nil
    end
    return temp
  end

  def empty?
    if (@h - @t >= 0)
      return false
    end
    @t=0
    return true
  end
end

class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
    @p = -1
  end

  def push(item)
    @p += 1
    @stack[@p] = item
    self.top =@stack[@p]
  end

  def pop
    temp = top
    @p -= 1
    if (!empty?)
      self.top = @stack[@p]
    else
      self.top = nil
    end
    return temp
  end

  def empty?
    if (@p>=0)
      return false
    end
    @p = -1
    return true
  end
end

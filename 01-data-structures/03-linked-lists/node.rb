class Node
  attr_accessor :next
  attr_accessor :data

  def initialize(data, nxt)
    self.data = data
    self.next = nil
  end
end

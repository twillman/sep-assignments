require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    self.head = nil
    self.tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if (self.head && self.tail)
      self.tail.next = node
      node.next = nil
      self.tail = node
    else
      self.head = node
      self.tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current = self.head
    if (current == self.tail)
      self.head = nil
      self.tail = nil
      return
    end
    while (current.next != tail)
      current = current.next
    end
    current.next = nil
    self.tail = current
  end

  # This method prints out a representation of the list.
  def print
    current = self.head
    while (current)
      puts current.data
      current =  current.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current = self.head
    while (current)
      if (current.next == node)
        current.next = node.next
        return
      end
      current = current.next
    end
    return false
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = self.head
    self.head = node
    return
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp = self.head
    self.head = self.head.next
    return temp
  end
end

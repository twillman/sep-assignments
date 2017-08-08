class Heap
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def find_parent(root, data)
    curr = root
    if (curr.left && curr.left.title == data)
      return curr
    elsif (curr.right && curr.right.title == data)
      return curr
    elsif (curr.left)
      return find_parent(curr.left, data)
    elsif (curr.right)
      return find_parent(curr.right, data)
    end
    return nil
  end

  def swap_up(root, node)
    parent = find_parent(root, node.title)
    if (parent.rating > node.rating)
      if (parent != root)
        p_parent = find_parent(parent, node.title)
        p_parent.left = node
      else
        self.root = node
      end
      if(parent.left.title == node.title)
        node.left = parent
        node.right = parent.right
      elsif (parent.right.title == node.title)
        node.right = parent
        node.left = parent.left
      end
      parent.left = nil
      parent.right = nil
    end
  end

  def insert(root, node)
    if (self.root)
      queue = Queue.new
      queue.push(self.root)
      while (!queue.empty?)
        temp = queue.pop
        if (temp.left)
          queue.push(temp.left)
        else
          temp.left = node
          swap_up(root, node)
          return temp.left
        end
        if (temp.right)
          queue.push(temp.right)
        else
          temp.right = node
          swap_up(root, node)
          return temp.right
        end
      end
      return
    end
  end

  def find_last()
    text = ""
    if (self.root)
      queue = Queue.new
      queue.push(self.root)
      while (!queue.empty?)
        temp = queue.pop
        if (temp.left)
          queue.push(temp.left)
        end
        if (temp.right)
          queue.push(temp.right)
        end
      end
      return temp
    end
  end

  def delete(root, data)
    if (!find(root,data))
      return nil
    end
    n = find(root, data)
    last = find_last()
    parent = find_parent(root, last.title)
    if (parent.left.title == last.title)
      parent.left = nil
    elsif (parent.right.title == last.title)
      parent.right = nil
    end
    if (n == last)
      return
    end
    n.title = last.title
    n.rating = last.rating
    swap_up(root, n.left)
    swap_up(root, n.right)
  end

  def find(root, data)
    if (!root)
      return nil
    end
    if (root.title == data)
      return root
    else
      if (root.right)
        return find(root.right, data)
      end
      if (root.left)
        return find(root.left, data)
      end
      return nil
    end
  end

  def printf()
    text = ""
    if (self.root)
      queue = Queue.new
      queue.push(self.root)
      while (!queue.empty?)
        temp = queue.pop
        text << temp.title << ":" << temp.rating.to_s
        if (temp.left)
          queue.push(temp.left)
        end
        if (temp.right)
          queue.push(temp.right)
        end
        text << "\n"
      end
      puts text
      return
    end
  end

end

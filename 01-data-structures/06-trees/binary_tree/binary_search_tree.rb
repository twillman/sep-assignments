class BinarySearchTree
  attr_accessor :root
  attr_accessor :test

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if (node.rating > root.rating)
      if(root.right)
        insert(root.right, node)
      else
        root.right = node
      end
    else
      if(root.left)
        insert(root.left, node)
      else
        root.left = node
      end
    end
    return
  end

  # Recursive Depth First Search
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


  def move_up(n)
    if (!n)
      return nil
    end
    if (n.left)
      n.title = n.left.title
      n.rating = n.left.rating
      n.left = move_up(n.left)
      return n
    elsif(n.right)
      n.title = n.right.title
      n.rating = n.right.rating
      n.right = move_up(n.right)
      return n
    else
      return nil
    end
  end

  def delete(root, data)
    if (!find(root,data))
      return nil
    end
    if(!move_up(find(root, data)))
      if (find(self.root, data) == root)
        self.root = nil
        return
      end
      n = find_parent(root, data)
      if (n.left && n.left.title == data)
        n.left = nil
      elsif (n.right && n.right.title == data)
        n.right = nil
      end
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
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

require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    root.left = nil
    root.right = nil
    self.root = root
  end

  def insert(root, node)
    if (node.rating > root.rating)
      if (!root.right)
        root.right = node
        return
      else
        insert(root.right, node)
      end
    else
      if (!root.left)
        root.left = node
        return
      else
        insert(root.left, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if (data)
      if (root.left)
        if (root.left.title == data)
          return root.left
        else
          return find(root.left, data)
        end
      else
        if (root.right.title == data)
          return root.right
        else
          return find(root.right, data)
        end
      end
    end
    return nil
  end

  def delete(root, data)
    if (data)
      x =find(root, data)
      while (x.left)
        x = x.left
      end
      x.title = nil
      x.rating = nil
    end
    return nil
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    if (self.root)
      queue=Queue.new
      queue.push(self.root)
      while(!queue.empty?)
        temp = queue.pop
        puts temp.title << ": "<< temp.rating.to_s
        if (temp.left)
          queue.push(temp.left)
        end
        if (temp.right)
          queue.push(temp.right)
        end
      end
      return
    end
    return
  end
end

require_relative 'node'

class BinarySearchTree

  def initialize(root)
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
      if(!root.left)
        root.left = node
        return
      else
        insert(root.left, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if (root.title == data)
      return root
    else
      if (root.left)
        if (root.left.title == data)
          return root.left
        else
          return find(root.left, data)
        end
      elsif (root.right)
        if(root.right.title == data)
          return root.right
        else
          return find(root.right, data)
        end
      end
      return nil
    end
  end

  def delete(root, data)
  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end
end

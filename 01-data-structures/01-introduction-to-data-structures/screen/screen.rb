require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width
    self.height =  height
    self.matrix=Array.new(height){Array.new(width)}
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if (inbounds(x,y))
      matrix[x][y]=pixel
    else
      return nil
    end
  end

  def at(x, y)
    if (inbounds(x,y))
      return matrix[x][y]
    else
      return nil
    end
  end

  private

  def inbounds(x, y)
    if (x>width || x<0 || y>height || y<0)
      return false
    end
    return true
  end

end

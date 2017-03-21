# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    members.push(person)
  end

  def leave(person)
    members.delete(person)
  end

  def front
    return members[0]
  end

  def middle
    mid_index = members.length/2
    mid_index = mid_index.floor
    return members[mid_index]
  end

  def back
    return members.last
  end

  def search(person)
    return members[members.index(person)]
  end

  private

  def index(person)
    members.rindex(person)
  end

end

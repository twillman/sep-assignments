# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    self.members[self.members.length]=person
  end

  def leave(person)
    members.delete(person)
  end

  def front
    return self.members[0]
  end

  def middle
    return self.members[self.members.length/2.floor()]
  end

  def back
    return self.members[self.members.length - 1]
  end

  def search(person)
    i = index(person)
    if (i)
      return self.members[i]
    end
    return nil
  end

  private

  def index(person)
    return members.rindex(person)
  end

end

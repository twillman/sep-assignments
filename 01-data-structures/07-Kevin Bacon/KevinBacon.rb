class Node
  attr_accessor :name
  attr_accessor :film_actor_hash

  @movie_array = []

  def initialize (name, hash)
    self.name = name
    self.film_actor_hash = hash
  end


  def in_a_movie_with_bacon(node) #was node in a movie w KB? returns movie or false
    movie_array = []
    for movies in node.film_actor_hash
      for actors in node.film_actor_hash[movie]
        if (actor.name == "Kevin Bacon")
          return movie
        end
      end
    end
    return false
  end



  def find_kevin_bacon(node) #returns movie array (if exisits) connecting to KB or false
    y = in_a_movie_with_bacon(node)
    if (y)
      return @movie_array.push(y)
    else
      for movies in node.film_actor_hash
        @movie_array.push(movie)
        for actors in node.film_actor_hash[movie]
          if (movie_array.length < 6)
            find_kevin_bacon(actor)
          else
            x = in_a_movie_with_bacon(actor)
            if (x)
              return @movie_array.push(x)
            end
          end
        end
        @movie_array.pop()
      end
    end
    return false
  end

end

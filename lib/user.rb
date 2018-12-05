
class User
  attr_reader :name, :jokes, :tell_repeated_joke

  def initialize(name)
    @name = name
    @jokes = []

    @tell_repeated_joke = false
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(name, joke)
    name.jokes << joke

    if @jokes.include?(joke)
      @tell_repeated_joke = true
    end
  end

  def joke_by_id(id)
    @jokes[id-1]
  end

end

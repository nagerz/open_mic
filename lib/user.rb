class User
  attr_reader :name, :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(name, joke)
    name.jokes << joke
  end

  def joke_by_id(id)
    @jokes[id-1]
  end

end

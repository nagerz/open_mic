# require './lib/joke'
# require './lib/user'
# require 'pry'
class OpenMic
  attr_reader :location, :date, :performers

  def initialize(showinfo)
    @location = showinfo[:location]
    @date = showinfo[:date]
    @performers = []
  end

  def welcome(name)
    @performers << name
  end

  def repeated_jokes?
    @performers.any? do |user|
      user.jokes.length != user.jokes.uniq.length
      #binding.pry
    end
  end
end

# open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
# sal = User.new("Sal")
# ali = User.new("Ali")
# open_mic.welcome(sal)
# open_mic.welcome(ali)
# joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
# joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
# ali.learn(joke_1)
# ali.learn(joke_2)
# #open_mic.repeated_jokes?
# ali.tell(sal, joke_1)
# open_mic.repeated_jokes?

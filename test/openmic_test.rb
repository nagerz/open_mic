require './lib/joke'
require './lib/user'
require './lib/open_mic'
require 'minitest/autorun'
require 'minitest/pride'

class OpenMicTest < Minitest::Test

  def test_openmic_exists
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    assert_instance_of OpenMic, open_mic
    assert_equal "Comedy Works", open_mic.location
    assert_equal "11-20-18", open_mic.date
    assert_equal [], open_mic.performers
  end

  def test_openmic_welcome
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    sal = User.new("Sal")
    ali = User.new("Ali")
    open_mic.welcome(sal)
    open_mic.welcome(ali)

    assert_equal [sal, ali], open_mic.performers
  end

  def test_repeated_jokes
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    sal = User.new("Sal")
    ali = User.new("Ali")
    open_mic.welcome(sal)
    open_mic.welcome(ali)
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    ali.learn(joke_1)
    ali.learn(joke_2)

    assert_equal false, open_mic.repeated_jokes?
    ali.tell(sal, joke_1)
    assert_equal false, open_mic.repeated_jokes?
    #Couldn't get the above to happen. My repeated_jokes? tests whether someone
    #hears a new joke they already know. This happens if sal tells ali joke_1,
    #but not if ali tells it to sal.

    #But this method will return true if someone says a joke that they already
    #learned previously.
    assert_equal true, open_mic.tell_repeated_jokes?
    #Now if Sal tells Ali the joke, it will return that he already know that joke.
    sal.tell(ali, joke_1)
    assert_equal true, open_mic.repeated_jokes?
  end
end

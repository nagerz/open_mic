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
    end
  end

  def tell_repeated_jokes?
    @performers.any? do |user|
      user.tell_repeated_joke
    end
  end
end

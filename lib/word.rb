class Word
  attr_accessor :word, :id

  @@words = {}
  @@total_rows = 0
  def initialize(word, id)
    @word = word
    @id = id || @@total_rows += 1
  end

  def self.all
    @@words.values()
  end

  def save

  end

end

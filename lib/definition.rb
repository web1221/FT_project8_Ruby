class Definitions
  attr_reader :id
  attr_accessor :definition, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(definition, word_id, id)
    @definition = definition
    @word_id = word_id
    @id = id || @@total_rows += 1
  end


  def self.clear
    @@definitions = {}
    @@total_rows = 0
  end


  def self.all
    @@definitions.values
  end

  def self.find(id)
    @@definitions[id]
  end

  def self.find_by_word(w_id)
    definitions = []
    @@definitions.values.each do |defi|
      if defi.word_id == w_id
        definitions.push(defi)
      end
    end
    definitions
  end
  
  def save
    @@definitions[self.id] = Definitions.new(self.definition, self.word_id, self.id)
  end

  def ==(definition_to_compare)
    (self.definition() == definition_to_compare.definition()) && (self.word_id() == definition_to_compare.word_id())
  end

  def update(definition, word_id)
    self.definition = definition
    self.word_id = word_id
    @@definitions[self.id] = Definitions.new(self.definition, self.word_id, self.id)
  end

  def delete
    @@definitions.delete(self.id)
  end


  def word
    Word.find(self.word_id)
  end

end

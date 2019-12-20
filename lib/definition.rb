class Definitions
  attr_reader :id
  attr_accessor :definition, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(definition, word_id, id)
    @defintion = definition
    @word_id = word_id
    @id = id || @@total_rows += 1
  end

  def ==(definition_to_compare)
    (self.definition() == definition_to_compare.definition()) && (self.word_id() == definition_to_compare.word_id())
  end

  def self.clear
    @@definitions = {}
    @@total_rows = 0
    end
end

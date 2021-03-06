require('rspec')
require('definition')
require('word')
require('pry')

describe('#Definitions') do
  before(:each) do
    Word.clear()
    Definitions.clear()
    @word = Word.new("timer", nil)
    @word.save()
  end

  describe('.clear') do
    it('clears all definitions') do
    definition = Definitions.new("a way to time travel", @word.id, nil)
    definition.save()
    definition2 = Definitions.new("oppisite of dimmer, the act of making a light brighter", @word.id, nil)
    definition2.save()
    Definitions.clear()
    expect(Definitions.all).to(eq([]))
    end
  end
  describe('#==') do
    it('is the same definiton is it has the same attributes') do
      definition = Definitions.new("a way to time travel", @word.id, nil)
      definition2 = Definitions.new("a way to time travel", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it('returns definitons of words') do
      definition = Definitions.new("a way to time travel", @word.id, nil)
      definition.save()
      definition2 = Definitions.new("oppisite of dimmer, the act of making a light brighter", @word.id, nil)
      definition2.save()
      expect(Definitions.all).to(eq([definition, definition2]))
    end
  end

  describe('#save') do
    it('saves a definition') do
      definition = Definitions.new("a way to time travel", @word.id, nil)
      definition.save()
      expect(Definitions.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it("finds a definitons by its id") do
      definition = Definitions.new("a way to time travel", @word.id, nil)
      definition.save()
      definition2 = Definitions.new("oppisite of dimmer, the act of making a light brighter", @word.id, nil)
      definition2.save()
      expect(Definitions.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it('it will update a definition or a word') do
      definition = Definitions.new("a way to time travel", @word.id, nil)
      definition.save()
      definition.update("oppisite of dimmer, the act of making a light brighter", @word.id)
      expect(definition.definition).to(eq("oppisite of dimmer, the act of making a light brighter"))
    end
  end

  describe('#delete') do
    it('deletes a definition by id') do
      definition = Definitions.new("a way to time travel", @word.id, nil)
      definition.save()
      definition2 = Definitions.new("oppisite of dimmer, the act of making a light brighter", @word.id, nil)
      definition2.save()
      definition.delete()
      expect(Definitions.all).to(eq([definition2]))
    end
  end

  describe('.find_by_word') do
    it('finds definitions for a word') do
      word2 = Word.new("Billboard", nil)
      word2.save()
      definition = Definitions.new("a way to time travel", @word.id, nil)
      definition.save()
      definition2 = Definitions.new("oppisite of dimmer, the act of making a light brighter", word2.id, nil)
      definition2.save()
      expect(Definitions.find_by_word(word2.id)).to(eq([definition2]))
    end
  end

  describe('#word') do
    it('find the word a definition belongs too') do
      definition = Definitions.new("Falling asleep", @word.id, nil)
      definition.save()
      expect(definition.word()).to(eq(@word))
    end
  end

  describe('#definitions') do
    it('returns a definition belonging to a word') do
      word2 = Word.new("Billboard", nil)
      word2.save()
      definition = Definitions.new("a way to time travel", @word.id, nil)
      definition.save()
      definition2 = Definitions.new("oppisite of dimmer, the act of making a light brighter", @word.id, nil)
      definition2.save()
      expect(@word.definitions).to(eq([definition, definition2]))
    end
  end
end

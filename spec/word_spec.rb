require('rspec')
require('pry')
require('word')

describe('#Word') do
  describe('.all') do
    it('is empty at first') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word1 = Word.new("universe", nil)
      word2 = Word.new("universe", nil)
      expect(word1).to(eq(word2))
    end
  end

  describe('#save') do
    it('will save words') do
      word1 = Word.new("universe", nil)
      word1.save()
      word2 = Word.new("template", nil)
      word2.save()
      expect(Word.all).to(eq([word1, word2]))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      word1 = Word.new("universe", nil)
      word1.save()
      word2 = Word.new("template", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds a word by id') do
      word = Word.new("places", nil)
      word.save()
      word2 = Word.new("catch", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end
end

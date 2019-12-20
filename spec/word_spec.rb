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
      # binding.pry
      expect(Word.all).to(eq([word1, word2]))
    end
  end
end

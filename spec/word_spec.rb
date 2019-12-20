require('rspec')
require('word')

describe('#Word') do
  describe('.all') do
    it('is empty at first') do
      expect(Word.all).to(eq([]))
    end
  end
  describe('#save') do
    it('will save words') do
      word = Word.new("universe", nil)
      word.save()
      word2 = Word.new("template", nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end
end

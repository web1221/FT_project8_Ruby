require('rspec')
require('pry')
require('word')
describe('#Word') do
  before(:each) do
    Word.clear()
    @word = Word.new("universe", nil)
    @word.save()
    @word2 = Word.new("time", nil)
    @word2.save()
  end

  describe('.all') do
    it('is empty at first') do
      Word.clear()
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
      expect(Word.all).to(eq([@word, @word2]))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds a word by id') do
      expect(Word.find(@word.id)).to(eq(@word))
    end
  end

  describe('#delete') do
    it('deletes a word by id') do
      @word.delete()
      expect(Word.all).to(eq([@word2]))
    end
  end

end

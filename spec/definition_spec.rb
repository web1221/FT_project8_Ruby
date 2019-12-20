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

  describe('#==') do
    it('is the same definiton is it has the same attributes') do
      definition = Definitions.new("a way to time travel", @word.id, nil)
      definition2 = Definitions.new("a way to time travel", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end
end

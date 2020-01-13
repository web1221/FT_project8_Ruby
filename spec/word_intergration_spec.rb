require('capybara/rspec')
require('./app')
require ('word')
require ('definition')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an word path', {:type => :feature}) do
  it('creates an word and then goes to the with all words') do
    visit('/words')
    click_on('Add a word!')
    fill_in('word_input', :with => 'People')
    fill_in('definition_input', :with => 'human beings in general or considered collectively.')
    click_on('Go!')
    expect(page).to have_content("People")
  end
  it('creates a definition for a word and then goes to the words page') do
    word = Word.new("People", nil)
    word.save
    id = word.id
    visit "/words/#{id}"
    fill_in('definition_input', :with => 'human beings in general or considered collectively.')
    click_on('Add a definition')
    save_and_open_page
    expect(page).to have_content("Human beings in general or considered collectively.")
  end
end

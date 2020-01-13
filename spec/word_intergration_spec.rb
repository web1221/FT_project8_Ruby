require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an word path', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
    visit('/words')
    click_on('Add a word!')
    fill_in('word_input', :with => 'People')
    fill_in('definition_input', :with => 'human beings in general or considered collectively.')
    click_on('Go!')
    expect(page).to have_content("People")
  end
end

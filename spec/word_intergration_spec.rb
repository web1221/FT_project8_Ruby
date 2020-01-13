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
    test_word = Word.new("People", nil)
    test_word.save
    id = test_word.id
    visit "/words/#{id}"
    fill_in('definition_input', :with => 'human beings in general or considered collectively.')
    click_on('Add a definition')
    expect(page).to have_content("Human beings in general or considered collectively.")
  end
  it 'allows a user to change the word' do
    test_word = Word.new('Charging', nil)
    test_word.save
    visit '/'
    click_link('Charging')
    click_link('Edit Word')
    fill_in('new_word', :with => 'Time')
    click_button('Update')
    expect(page).to have_content('Time')
    end
  it 'allows a user to edit a definition' do
    test_word = Word.new("People", nil)
    test_word.save
    id = test_word.id
    visit "/words/#{id}"
    fill_in('definition_input', :with => 'Human beings in general or considered collectively.')
    click_on('Add a definition')
    click_link('Human beings in general or considered collectively.')
    fill_in('definition_input', :with => 'Wow what a wonderful world')
    click_button('Update definition')
    expect(page).to have_content('Wow what a wonderful world')
    end
  it 'allows a user to delete a definition' do
    test_word = Word.new("People", nil)
    test_word.save
    id = test_word.id
    visit "/words/#{id}"
    fill_in('definition_input', :with => 'Human beings in general or considered collectively.')
    click_on('Add a definition')
    click_link('Human beings in general or considered collectively.')
    click_button('Delete definition')
    expect(page).to have_content('')
    end
  end

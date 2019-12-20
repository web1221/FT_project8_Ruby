require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end
post('/words') do
  word = Word.new(params[:word_input])
  word.save
  @words = Word.all
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

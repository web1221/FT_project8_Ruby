require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
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
  word = Word.new(params[:word_input], nil)
  word.save()
  @words = Word.all
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:new_word])
  @words = Word.all
  erb(:words)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  erb(:words)
end

get('/words/:id/definition/:definition_id') do
  @word = Word.find(params[:id].to_i())
  @definition = Definitions.new(params[:definition_id].to_i(), @word.id, nil)
  erb(:definition)
end

post('/words/:id/definition') do
  @word = Word.find(params[:id].to_i())
  @definition = Definitions.new(params[:definition_input], @word.id, nil)
  @definition.save()
  erb(:word)
end

patch('/words/:id/definition/:definition_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definitions.find(params[:definition_id].to_i())
  definition.update(params[:definition_input], @word.id)
  erb(:definition)
end

delete('/words/:id/definition/:definition_id') do
  definition = Definitions.find(params[:definition_id].to_i())
  definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

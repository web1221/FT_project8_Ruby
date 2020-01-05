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
  definition = Definitions.new(params[:definition_input], word.id, nil)
  definition.save()
  @words = Word.all
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

get('/words/:id') do
  @words = Word.find(params[:id].to_i())
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
  @words = Word.all
  erb(:words)
end

post('/words/:id/definition') do
  @words = Word.find(params[:id].to_i())
  definition = Definitions.new(params[:definition_input], @words.id, nil)
  definition.save()
  erb(:word)
end

get('/words/:id/definition/:definition_id') do
  @words = Word.find(params[:id].to_i())
  @definitions = Definitions.find(params[:definition_id])
  @definition = Definitions.new(params[:definition_input], @words.id, nil)
  erb(:definition)
end

get('/words/:id/definition/:definition_id/edit') do
  @definition = Definitions.find(params[:definition_id].to_i())
  erb(:edit_def)
end

patch('/words/:id/definition/:definition_id') do
  # @words = Word.find(params[:id].to_i())
  # definition = Definitions.find(params[:definition_id].to_i())
  # definition.update(params[:definition_input], @words.id)
  # erb(:word)
  @definitions = Definitions.find(params[:id].to_i())
  @definitions.update(params[:new_def])
  @definitions = Definitions.all
  erb(:word)
end

delete('/words/:id/definition/:definition_id') do
  definition = Definitions.find(params[:definition_id].to_i())
  definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

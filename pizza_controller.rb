require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative "./models/pizza"

get '/pizzas' do
  @pizzas = Pizza.all()
  erb(:index)
end

# put most specific functions first. ie, this function will be found before the show function because it looks for anything after/pizzas/...
get '/pizzas/new' do
  erb(:new)
end

get '/pizzas/:id/edit' do
  @pizza = Pizza.find(params['id'])
  erb(:edit)
end

get '/pizzas/:id' do
  @pizza = Pizza.find(params['id'])
  erb(:show)
end

post '/pizzas' do
  @pizza = Pizza.new(params)
  @pizza.save()
  erb(:create)
end

post '/pizzas/:id' do
  @pizza = Pizza.new(params)
  @pizza.update()
  erb(:update)
end

post '/pizzas/:id/delete' do
  pizza = Pizza.find(params['id'])
  pizza.delete()
  erb(:delete)
end

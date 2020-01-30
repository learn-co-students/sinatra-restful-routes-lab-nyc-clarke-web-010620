require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    new_name = params[:name]
    new_ingredients = params[:ingredients]
    new_cook_time = params[:cook_time]
    #binding.pry
    @recipe = Recipe.create(name: new_name, ingredients: new_ingredients, cook_time: new_cook_time)
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    #binding.pry
    erb :edit
  end
  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    #binding.pry
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    #binding.pry
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    #binding.pry
    @recipe.destroy
    redirect to '/recipes'
  end
end

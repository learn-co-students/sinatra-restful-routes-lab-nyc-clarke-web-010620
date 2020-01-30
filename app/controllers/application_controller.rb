class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!



get "/recipes" do
  @recipes = Recipe.all
  erb :index
end

get "/recipes/new" do
  erb :new
end

get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])

    erb :show
end

post "/recipes" do
    new_recipe = Recipe.create(params)
    
    redirect to "/recipes/#{new_recipe.id}"
end

get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])

    erb :edit
end

patch "/recipes/:id" do 
    @recipe = Recipe.find(params[:id])

    @recipe.update(name: params[:name])
    @recipe.update(ingredients: params[:ingredients])
    @recipe.update(cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
end

delete "/recipes/:id" do 
  @recipe = Recipe.find(params[:id])
  @recipe.destroy

  redirect to "/recipes"
end



end

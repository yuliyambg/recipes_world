class RecipesController < ApplicationController


  #CREATE
  get '/recipes/new' do
    erb :'recipes/new'
  end

  post '/recipes' do
    recipe = Recipe.new(params)
    if !recipe.title.empty? &&  !recipe.preparation.empty?
       recipe.save
      redirect '/recipes'
    else
      @error = "Data invalid. Please try again."
      erb :'/recipes/new'
    end
  end

  #READ
  get '/recipes' do
    @recipes = Recipe.all.reverse
    erb :'recipes/index'
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :'recipes/show'
  end

  #UPDATE
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :'/recipes/edit'
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    if !params["recipe"]["title"].empty? &&  !params["recipe"]["preparation"].empty?
      @recipe.update(params["recipe"])
      redirect "/recipes/#{params[:id]}"
    else
       @error = "Data invalid. Please try again."
       erb :'/recipes/edit'
      end
  end

  #DESTROY
  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect '/recipes'
    end

end
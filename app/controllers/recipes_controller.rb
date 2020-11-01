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



end
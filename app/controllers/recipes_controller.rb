class RecipesController < ApplicationController

  #CREATE
  get '/recipes/new' do
    # if User.find_by(id: session[:user_id])
    if logged_in?
      erb :'recipes/new'
    else
      redirect '/login'
    end
    end

  post '/recipes' do
    # recipe = Recipe.new(params)
    # User.find_by(id: session[:user_id]).recipes.build(params)

    #validation/authorization edit
    recipe = current_user.recipes.build(params)
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
    # if User.find_by(id: session[:user_id])
    if logged_in?
    @recipes = Recipe.all.reverse
    erb :'recipes/index'
    else
      redirect '/login'
      end
  end

  #SHOW
  get '/recipes/:id' do
    # if User.find_by(id: session[:user_id])
      if logged_in?
        @recipe = Recipe.find_by(id: params[:id])
        if @recipe
          erb :'recipes/show'
        else
          redirect '/recipes'
        end
    else
      redirect '/login'
    end
  end

  #UPDATE
  get '/recipes/:id/edit' do
    if logged_in?
      @recipe = Recipe.find(params[:id])
      erb :'/recipes/edit'
    else
      redirect '/login'
    end
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
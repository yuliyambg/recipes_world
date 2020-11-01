class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    #username and password cannot be blank
    # username can not already exist
    user = User.new(params)
    if user.username.empty? || user.password.empty?
      @error = "Username and Password can't be blank"
      erb :'users/signup'
    elsif User.find_by(username: user.username)
      @error = "Account with that username already exists"
    else
      user.save
      #if logged in
      session[:user_id] = user.id
      redirect '/recipes'
    end
  end

end
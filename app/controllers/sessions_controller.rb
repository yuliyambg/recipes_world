class SessionsController < ApplicationController
  #login

  get '/login' do
    erb :'users/login'
  end


  post '/login' do
    if params["username"].empty? || params["password"].empty?
      @error = "Username and Password can't be blank"
      erb :'users/login'
    else
      if user = User.find_by(username: params["username"], password: params["password"])
    # log in
      session[:user_id] = user.id
    redirect '/recipes'
      else
        @error = "Account not found"
        erb :'users/login'
      end
    end
    end
    #logout
    get '/logout' do
      session.clear
      redirect '/'
    end




end
require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  #Helper methods
  def logged_in?
    # !!User.find_by(id: session[:user_id])
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end

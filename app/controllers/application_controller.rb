require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, ENV['SESSION_SECRET']
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def is_logged_in?
      !!session[:user_id]
    end

    def redirect_if_logged_in
      redirect '/wines' if is_logged_in?
    end

    def redirect_if_not_logged_in
      redirect '/login' unless is_logged_in?
    end

    def current_user
      User.find_by_id(session[:user_id])
    end
  end

end

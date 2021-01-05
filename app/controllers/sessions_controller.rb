class SessionController < ApplicationController
    get '/signup' do
        
        erb :'sessions/signup'
    end

    post '/signup' do
        user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id
            redirect '/wines'
        else
            redirect '/signup'
        end
    end

    get '/login' do
        
        erb :'sessions/login'
    end

    post '/login' do
        user = User.find_by_username(params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect '/wines'
        else
            redirect '/login'
        end
    end

    get '/logout' do
        session.clear
        redirect '/login'
    end
end
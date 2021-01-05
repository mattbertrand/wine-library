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
        binding.pry
    end
end
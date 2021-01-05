class WinesController < ApplicationController
    
    get '/wines' do
        @wines = Wine.all
        erb :'wines/index'
    end

    get '/wines/new' do
        erb :'wines/new'
    end

    post '/wines' do
        binding.pry
        wine = Wine.new(params[:wine])

        if wine.save
            redirect '/wines'
        else
            redirect '/wines/new'
        end
    end
end
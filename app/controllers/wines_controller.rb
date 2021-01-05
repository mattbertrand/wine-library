class WinesController < ApplicationController
    
    get '/wines' do
        @wines = Wine.all
        erb :'wines/index'
    end

    get '/wines/new' do
        erb :'wines/new'
    end

    get '/wines/:id' do
        @wine = Wine.find_by_id(params[:id])
        erb :'wines/show'
      end

    post '/wines' do
        wine = Wine.new(params[:wine])

        if wine.save
            redirect '/wines'
        else
            redirect '/wines/new'
        end
    end
end
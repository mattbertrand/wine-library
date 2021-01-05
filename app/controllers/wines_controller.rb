class WinesController < ApplicationController
    
    get '/wines' do
        @wines = Wine.all
        erb :'wines/index'
    end

    get '/wines/new' do
        erb :'wines/new'
    end
    
    get '/wines/:id' do
        find_wine
        erb :'wines/show'
    end

    get '/wines/:id/edit' do
        find_wine
        erb :'wines/edit'
    end

    post '/wines' do
        wine = Wine.new(params[:wine])

        if wine.save
            redirect '/wines'
        else
            redirect '/wines/new'
        end
    end

    patch '/wines/:id' do
        find_wine
        if @wine.update(params[:wine])
            redirect "/wines/#{@wine.id}"
        else
            redirect "/wines/#{@wine.id}/edit"
        end
    end

    private

    def find_wine
        @wine = Wine.find_by_id(params[:id])
    end
end
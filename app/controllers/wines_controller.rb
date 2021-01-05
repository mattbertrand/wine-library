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
        redirect_if_wine_not_found
        erb :'wines/show'
    end

    get '/wines/:id/edit' do
        find_wine
        redirect_if_wine_not_found
        erb :'wines/edit'
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

    patch '/wines/:id' do
        find_wine
        redirect_if_wine_not_found
        if @wine.update(params[:wine])
            redirect "/wines/#{@wine.id}"
        else
            redirect "/wines/#{@wine.id}/edit"
        end
    end

    delete '/wines/:id' do
        find_wine
        @wine.destroy if @wine
        redirect '/wines'
    end

    private

    def find_wine
        @wine = Wine.find_by_id(params[:id])
    end

    def redirect_if_wine_not_found
        redirect "/wines" unless @wine
    end
end
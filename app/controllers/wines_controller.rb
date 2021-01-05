class WinesController < ApplicationController
    get '/wines/new' do
        erb :'wines/new'
    end

    post '/wines' do
        wine = Wine.new(params[:wine])
    end
end
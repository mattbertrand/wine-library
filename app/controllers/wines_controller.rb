class WinesController < ApplicationController
    get '/wines/new' do
        erb :'wines/new'
      end
end
class WinesController < ApplicationController
    
    get '/wines' do
        redirect_if_not_logged_in
        @wines_recently_added = Wine.all.reverse.first(10)
        @wines = Wine.all
        @user_wines = current_user.wines
        @wine = Wine.find_by_id(session[:wine_id])
        erb :'wines/index'
    end

    get '/wines/new' do
        redirect_if_not_logged_in
        erb :'wines/new'
    end
    
    get '/wines/:id' do
        redirect_if_not_logged_in
        find_wine
        redirect_if_wine_not_found
        session[:wine_id] = @wine.id if @wine
        erb :'wines/show'
    end

    get '/wines/:id/edit' do
        redirect_if_not_logged_in
        find_wine
        redirect_if_wine_not_found
        redirect_if_not_owner
        erb :'wines/edit'
    end

    post '/wines' do
        wine = current_user.wines.build(params[:wine])

        if wine.save
            redirect '/wines'
        else
            flash[:errors] = wine.errors.full_messages
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
        redirect_if_wine_not_found
        redirect_if_not_owner
        @wine.destroy
        redirect '/wines'
    end

    private

    def find_wine
        @wine = Wine.find_by_id(params[:id])
    end

    def redirect_if_wine_not_found
        redirect "/wines" unless @wine
    end

    def redirect_if_not_owner
        redirect '/wines' unless @wine.user == current_user
    end
end
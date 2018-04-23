
class UserController < ApplicationController

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/destinations'
    else
      redirect '/'
    end
  end

  get '/signup' do
    if logged_in?
      redirect '/destinations'
    else
      erb :'users/new'
    end
  end

  post '/signup' do
    user = User.new(:email => params[:email], :username => params[:username], :password => params[:password])
    if user.save && user.username != "" && user.email != ""
      session[:user_id] = user.id
      redirect '/destinations'
    else
      redirect '/signup'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    @trips = @user.trips
    erb :'/users/show'
  end

  get '/users/:slug/edit' do
    @user = User.find_by_slug(params[:slug])
    if current_user == @user
      erb :'/users/edit'
    elsif logged_in?
      #flash message for no access allowed
      redirect '/destinations'
    else
      #flash message to log in
      redirect '/'
    end
  end

  patch '/users/:slug' do
  end

  delete '/users/:slug' do

  end

  get '/logout' do
   session.clear
   redirect '/'
  end
end

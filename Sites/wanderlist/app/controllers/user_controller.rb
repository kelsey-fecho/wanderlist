require 'rack-flash'

class UserController < ApplicationController
  use Rack::Flash

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
      flash[:message] = "Successfully created a new user account"
      redirect '/'
    else
      redirect '/signup'
    end
  end

  get '/users' do
    @users = User.all
    erb :"users/index"
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    @trips = @user.trips
    erb :'/users/show'
  end

  get '/logout' do
   session.clear
   redirect '/'
  end
end

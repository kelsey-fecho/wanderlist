class TripController < ApplicationController

  get '/trips' do
    if logged_in?
      @trips = Trip.all
      erb :'/trips/index'
    else
      redirect '/'
    end
  end

  get '/trips/new' do
    if logged_in?
      erb :'/trips/new'
    else
      #flash message about needing to log in
      redirect '/'
    end
  end

  post '/trips' do
    trip = Trip.create(params)
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :'/trips/show'
  end
end

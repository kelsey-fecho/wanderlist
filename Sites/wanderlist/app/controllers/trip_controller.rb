class TripController < ApplicationController

  get '/trips' do
    if logged_in?
      @trips = Trip.all
      erb :'/trips/index'
    else
      redirect '/'
    end
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :'/trips/show'
  end
end

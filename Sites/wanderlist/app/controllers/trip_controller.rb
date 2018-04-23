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
      @dests = Destination.all
      erb :'/trips/new'
    else
      #flash message about needing to log in
      redirect '/'
    end
  end

  post '/trips' do
    @trip = Trip.new(:description => params[:description], :status => params[:status])
    params[:destination_ids].each do |dest|
      @trip.destinations << Destination.find(dest)
    end
    if params[:new_destination] != "" && Destination.all.find{|d| d.name == params[:new_destination]}
      dest = Destination.new(:name => params[:new_destination], :description => params[:dest_description])
      dest.save
      @trip.destinations << dest
    end
    @trip.user_id = session[:user_id]
    @trip.save
    binding.pry
    redirect "/trips/#{@trip.id}"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :'/trips/show'
  end
end

class TripController < ApplicationController

  get '/trips' do
    if logged_in?
      @trips = Trip.all
      erb :'/trips/index'
    else
      flash[:message] = "Please log in to view trips"
      redirect '/'
    end
  end

  get '/trips/new' do
    if logged_in?
      @dests = Destination.all
      erb :'/trips/new'
    else
      flash[:message] = "Please log in to create a new trip"
      redirect '/'
    end
  end

  post '/trips' do
    trip = Trip.new(:description => params[:description], :status => params[:status])
    if params[:destination_ids]
      params[:destination_ids].each do |dest|
        trip.destinations << Destination.find(dest)
      end
    end
    if params[:new_destination] != "" && !Destination.all.find{|d| d.name == params[:name]}
      trip.destinations Destination.create(:name => params[:new_destination], :description => params[:dest_description])
    end
    trip.user_id = session[:user_id]
    trip.save
    flash[:message] = "Successfully created a new trip"
    redirect "/trips/#{trip.id}"
  end

  get '/trips/:id' do
    if logged_in?
      @trip = Trip.find(params[:id])
      erb :'/trips/show'
    else
      flash[:message] = "Please log in to view trips"
      redirect '/'
    end
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    if logged_in? && session[:user_id] == @trip.user_id
      @dests = Destination.all
      erb :'/trips/edit'
    elsif logged_in?
      flash[:message] = "You are not authorized to edit this trip"
      redirect '/trips'
    else
      flash[:message] = "Please log in to edit trips"
      redirect '/'
    end
  end

  patch '/trips/:id' do
    trip = Trip.find(params[:id])
    trip.description = params[:description]
    trip.status = params[:status]
    trip.destinations.clear
    if params[:destination_ids]
      params[:destination_ids].each do |dest|
        trip.destinations << Destination.find(dest)
      end
    end
    if params[:new_destination] != "" && !Destination.all.find{|d| d.name == params[:name]}
      trip.destinations Destination.create(:name => params[:new_destination], :description => params[:dest_description])
    end
    trip.save
    flash[:message] = "Trip successfully updated"
    redirect "/trips/#{trip.id}"
  end

  post '/trips/:id/delete' do
    trip = Trip.find(params[:id])
    if logged_in? && trip.user_id == session[:user_id]
      trip.delete
      flash[:message] = "Trip successfully deleted"
      redirect '/trips'
    elsif logged_in?
      flash[:message] = "You are not authorized to delete this trip"
      redirect '/trips'
    else
      flash[:message] = "Please log in to manage trips"
      redirect '/'
    end
  end
end

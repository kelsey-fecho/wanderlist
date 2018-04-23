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
    redirect "/trips/#{trip.id}"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :'/trips/show'
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    if logged_in && session[:user_id] == @trip.user_id
      @dests = Destination.all
      erb :'/trips/edit'
    elsif logged_in?
      #flash message for you don't have access to this
      redirect '/trips'
    else
      #flash message for you need to log in
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
    redirect "/trips/#{trip.id}"
  end

  post '/trips/:id/delete' do
    trip = Trip.find(params[:id])
    if logged_in? && trip.user_id == session[:user_id]
      trip.delete
      #flash message for trip successfully deleted
      redirect '/trips'
    elsif logged_in?
      #flash message that you don't have access to do This
      redirect '/trips'
    else
      #flash message for please log in
      redirect '/'
    end
  end
end

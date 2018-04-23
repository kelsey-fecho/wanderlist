class DestinationController < ApplicationController
  get '/destinations' do
    @dests = Destination.all
    erb :'destinations/index'
  end

  get '/destinations/new' do
    if logged_in?
      erb :'destinations/new'
    else
      #add flash message to log in
      redirect '/'
    end
  end

  post '/destinations/new' do
    if Destination.all.find{|d| d.name == params[:name]}
      #add a flash message for failure
      redirect '/destinations/new'
    elsif params[:name] != "" && params[:description] != ""
      @dest = Destination.create(params)
      #add a flash message for success
      redirect "/destinations/#{@dest.id}"
    end
  end

  get '/destinations/:id' do
    if logged_in?
      @dest = Destination.find(params[:id])
      erb :'destinations/show'
    else
      #add flash message to log in
      redirect '/'
    end
  end
end

class DestinationController < ApplicationController
  get '/destinations' do
    @dests = Destination.all
    erb :'destinations/index'
  end

  get '/destinations/new' do
    erb :'destinations/new'
  end

  post '/destinations/new' do
    if Destination.all.find{|d| d.name == params[:name]}
      #add a flash message for failure
      redirect '/destinations/new'
    else
      @dest = Destination.create(params)
      #add a flash message for success
      redirect "/destinations/#{@dest.id}"
    end
  end

  get '/destinations/:id' do
    @dest = Destination.find(params[:id])
    erb :'destinations/show'
  end
end

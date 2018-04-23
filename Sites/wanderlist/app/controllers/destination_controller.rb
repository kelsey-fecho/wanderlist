class DestinationController < ApplicationController
  get '/destinations' do
    @dests = Destination.all
    erb :'destinations/index'
  end

  get '/destinations/:id' do
    @dest = Destination.find(params[:id])
    erb :'destinations/show'
  end
end

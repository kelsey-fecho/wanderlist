class DestinationController < ApplicationController
  get '/destinations' do
    @dests = Destination.all
    erb :'destinations/index'
  end
end

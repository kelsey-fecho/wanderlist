class DestinationController < ApplicationController
  get '/destinations' do
    @dests = Destination.all
    erb :'destinations/index'
  end

  get '/destinations/new' do
    if logged_in?
      erb :'destinations/new'
    else
      flash[:message] = "Please log in to add destinations"
      redirect '/'
    end
  end

  post '/destinations/new' do
    if Destination.all.find{|d| d.name == params[:name]}
      flash[:message] = "This destination already exists."
      redirect '/destinations/new'
    elsif params[:name] != "" && params[:description] != ""
      @dest = Destination.create(params)
      flash[:message] = "You've successfully added a destination."
      redirect "/destinations/#{@dest.id}"
    end
  end

  get '/destinations/:id' do
    if logged_in?
      @dest = Destination.find(params[:id])
      erb :'destinations/show'
    else
      flash[:message] = "Please log in to view destinations."
      redirect '/'
    end
  end
end

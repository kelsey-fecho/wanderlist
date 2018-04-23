require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "jacuzzi"
  end

  get "/" do
    if logged_in?
      redirect '/destinations'
    else
      erb :index
    end
  end

end

require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "relion_project_management"
  end

  get '/' do
    erb :'index'
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def time_project_created
      DateTime.now
    end

    def time_user_created
      DateTime.now
    end

    def self.user_username_downcase
      @current_user.username.user_username_downcase
    end
  end
end
class UsersController < ApplicationController

    get '/users/:slug' do
        
      if @user = User.find_by_slug(params[:slug])
        erb :'users/show'
      else
        redirect to '/projects'
      end

    end
  
    get '/signup' do
      if !logged_in?
        erb :'users/create_user' 
      else
        redirect to '/projects'
      end
    end
  
    post '/signup' do
        @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password], :created_at => params[:created_at], :name => params[:name])
        if @user.save
          session[:user_id] = @user.id
          redirect to '/projects'
        else
          redirect to '/signup'
        end
      
    end
  
    get '/login' do
      if !logged_in?
        erb :'users/login'
      else
        redirect to '/projects'
      end
    end
  
    post '/login' do
      user = User.find_by(:username => params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        
        redirect to "/projects"
      else
        redirect to '/'
      end
    end
  
    get '/logout' do
      if logged_in?
        
        session.destroy
        redirect to '/login'
      else
        redirect to '/'
      end
    end
  end
class SessionsController < ApplicationController
    helper_method :current_user, :logged_in?
    
    def welcome
        current_user
    end

    def new
        @user = User.new
    end

    def create
        if auth_hash = request.env["omniauth.auth"]
            @user = User.find_or_create_by_omniauth(auth_hash)
            session[:id] = @user.id
            redirect_to '/users/show'
        elsif @user = User.find_by(username: params[:username])  && @user.authenticate(params[:password])
            session[:id] = @user.id
            redirect_to '/users/show'
        else
            redirect_to '/login', notice: 'Invalid Username or Password.'
            end
    end  
    
    
    def logout
        logged_in?
        session.destroy
        redirect_to '/'
    end

end
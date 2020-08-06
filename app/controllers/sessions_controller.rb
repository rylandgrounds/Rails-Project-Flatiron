class SessionsController < ApplicationController
    helper_method :current_user, :logged_in?
    
    def welcome
    end

    def new
        if logged_in?
            redirect_to user_path(@current_user)
        else
            @user = User.new
        end
    end

    def create
        if auth_hash = request.env["omniauth.auth"]
            @user = User.find_or_create_by_omniauth(auth_hash)
            session[:id] = @user.id
            redirect_to user_path(@user)
        elsif @user = User.find_by(email: params[:email])  && @user.authenticate(params[:password])
            session[:id] = @user.id
            redirect_to user_path(@user)
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
class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to 'users/new'
        end
    end
    
    def show
        current_user
    end
    
    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
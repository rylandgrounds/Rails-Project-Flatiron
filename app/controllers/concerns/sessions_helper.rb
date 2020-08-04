module SessionsHelper
    def current_user
        if session[:id]
        @current_user = User.find_by(id: session[:id])
        end
    end

    def logged_in?
        if @current_user = current_user
            @current_user
        else
            redirect_to 'sessions/new'
        end
    end
    
end
module ApplicationHelper
    def current_user
        if session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id])
        end
    end
    
    def logged_in?
        !!current_user
    end

    def require_login
        if !current_user
            redirect_to '/login'
        end
    end

    def require_ownership
        @review = Review.find_by(id: params[:id])
        if @review.user.id != current_user.id
            redirect_to user_path(current_user)
        end
    end
end

class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        # memoization return current user else user from session
        @current_user || User.find(session[:user_id]) if session[:user_id]
    end


    def logged_in?
        !!current_user
    end


    def require_user
        if !logged_in?
            flash[:danger] = "YOu must be logged in to perform that action"
            redirect_to root_path
        end
    end

end

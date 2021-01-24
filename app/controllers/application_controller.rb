class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def logged_in? 
        !!session[:user_id]
    end 

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def require_login
        unless current_user
            redirect_to '/'
        end
    end 
end
class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user 
        @user = User.find_by(id: session[:user_id])
    end 

    def require_login
        unless current_user
            redirect_to '/'
        end
    end 
end
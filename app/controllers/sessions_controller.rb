class SessionsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new
    end

    def create
        if request.env["omniauth.auth"]
          #they logged in via OAuth
          oauth_name = request.env["omniauth.auth"]["info"]["nickname"]
          oauth_id = request.env["omniauth.auth"]["info"]["uid"]
          if @user = User.find_by(:name => oauth_name)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
            @user = User.create(:name => oauth_name, :id => oauth_id, :password => SecureRandom.hex)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          end
        else
          #Normal login with username and password
          @user = User.find_by(name: params[:user][:name])
          if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
            @error = "Invalid login credentials. Please try again."
            render :new
          end
        end
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
end
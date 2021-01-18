class SessionsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new
      @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          @error = "Invalid login credentials. Please try again."
          render :new
        end
      end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
end
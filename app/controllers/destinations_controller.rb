class DestinationsController < ApplicationController
    def index
        @user = current_user
        @destinations = @user.destinations
    end
    
    def new
        @destination = Destination.new
    end

    def create
        @destination = Destination.new(destination_params)
        if @destination.save
            redirect_to destinations_path
        else
            render :new
        end
    end

    private

    def destination_params
        params.require(:destination).permit(:name)
    end
end
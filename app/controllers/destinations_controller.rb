class DestinationsController < ApplicationController
    def index
        @destinations = current_user.destinations
    end
    
    def new
        @destination = Destination.new
    end

    def create
        @destination = Destination.new(destination_params)
        if @destination.save
            redirect_to @destination
        else
            render :new
        end
    end

    def show
        @destination = Destination.find_by_id(params[:id])
    end

    private

    def destination_params
        params.require(:destination).permit(:name)
    end
end
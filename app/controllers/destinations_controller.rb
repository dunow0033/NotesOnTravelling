class DestinationsController < ApplicationController
    def index
        @destinations = current_user.destinations
       
    end
    
    def new
        @destination = Destination.new
    end

    def create
        @destination = Destination.new(destination_params)
        current_user.destinations.build(destination_params)
        current_user.save


        if @destination.save
            redirect_to destinations_path
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
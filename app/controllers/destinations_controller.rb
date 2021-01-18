class DestinationsController < ApplicationController
    def index
        @destinations = Destination.all
        # this is what this should be, but it's not working!!!
        #@destinations = current_user.destinations
    end
    
    def new
        @destination = Destination.new
    end

    def create
        @destination = Destination.new(destination_params)
        if @destination.save
            redirect_to destination_path(@destination)
        else
            render :new
        end
    end

    private

    def destination_params
        params.require(:destination).permit(:name)
    end
end
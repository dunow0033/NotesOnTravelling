class DestinationsController < ApplicationController
    def index
        @most_commented = Destination.most_notes.first
        @destinations = current_user.destinations
    end
    
    def new
        @destination = Destination.new
    end

    def create
        @destination = Destination.find_by_id(params[:destination][:id])
        if @destination.nil?
            @destination = Destination.create(destination_params)
            @destination.user_id = current_user.id
            #binding.pry

            if @destination.save
                redirect_to @destination
            else
                render :new
            end
        else  
            redirect_to @destination
        end
    end

    def show
        @destination = Destination.find_by(id: params[:id])
    end

    private

    def destination_params
        params.require(:destination).permit(:name)
    end
end
class DestinationsController < ApplicationController
    def index
        @destinations = Destination.all
    end

    def new
        @destination = Destination.new
    end

    def create
        @destination = Destination.create(destination_params)
        redirect_to destination_path(@destination)
    end

    def show
        @destination = Destination.find_by(id: params[:id])
        @note = @destination.notes.build(user_id: current_user.id)
    end

    def edit
        @destination = Destination.find_by(id: params[:id])
        @note = @destination.notes.build(user_id: current_user.id)
    end

    def update
        @destination = Destination.find_by(id: params[:id])
        @destination.update(destination_params)
        redirect_to destination_path(@destination)
    end

    private 

    def attraction_params 
        params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
    end 
end
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
        @ride = @attraction.rides.build(user_id: current_user.id)
    end

    def edit
        @attraction = Attraction.find_by(id: params[:id])
        @ride = @attraction.rides.build(user_id: current_user.id)
    end

    def update
        @attraction = Attraction.find_by(id: params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    private 

    def attraction_params 
        params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
    end 
end
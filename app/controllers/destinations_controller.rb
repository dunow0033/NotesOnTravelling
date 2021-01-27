class DestinationsController < ApplicationController
    def index
        @most_commented = current_user.destinations.most_notes.first
        @destinations = current_user.destinations
    end
    
    def new
        @destinations = current_user.destinations
        @destination = Destination.new
    end

    def create
        if params[:destination][:id].blank? && params[:destination][:name].blank?
            @destinations = current_user.destinations
            @destination = Destination.new
            flash[:alert] = "Destination Can't Be Blank!!  Please try again!!"
            render :new
        elsif params[:destination][:id].present? && params[:destination][:name].present?
            @destinations = current_user.destinations
            @destination = Destination.new
            flash[:alert] = "Please choose menu option OR new destination option, NOT BOTH!!"
            render :new
        else
            @destination = Destination.find_by_id(params[:destination][:id])
            if @destination.nil?
                @destination = Destination.create(destination_params)
                @destination.user_id = current_user.id

                if @destination.save
                    redirect_to @destination
                else
                    render :new
                end
            else  
                redirect_to @destination
            end
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
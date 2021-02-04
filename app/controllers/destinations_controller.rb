class DestinationsController < ApplicationController
    def index
        @most_commented = Destination.all.most_notes.first
        @destinations = Destination.all.order(:name)
    end
    
    def new
        @destination = Destination.new
    end

    def create
        if params[:destination][:id].blank? && params[:destination][:name].blank?
            @destination = Destination.new
            flash[:alert] = "Destination Can't Be Blank!!  Please try again!!"
            render :new
        elsif params[:destination][:id].present? && params[:destination][:name].present?
            @destination = Destination.new
            flash[:alert] = "Please choose menu option OR new destination option, NOT BOTH!!"
            render :new
        elsif params[:destination][:name].present?
            @tryDestination = params[:destination][:name]
            @tryDatabase = Destination.find_by(name: params[:destination][:name])

            if !@tryDatabase.nil? && @tryDestination == @tryDatabase.name
                @destination = Destination.new
                flash[:alert] = "That destination already exists!!  Please try again!!"
                render :new
            else
                @destination = Destination.create(destination_params)
                @destination.user_id = current_user.id

                if @destination.save
                    redirect_to @destination
                else
                    @destination = Destination.new
                    flash[:alert] = "Destination not properly saved!!  Please try again!!"
                    render :new
                end
            end
        else
            @destination = Destination.find_by_id(params[:destination][:id])
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
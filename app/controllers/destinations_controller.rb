class DestinationsController < ApplicationController
    def index
        @destinations = Destination.all
    end

    def show
        @destination = Destination.find_by(id: params[:id])
        @note = @destination.notes.build(user_id: current_user.id)
    end
end
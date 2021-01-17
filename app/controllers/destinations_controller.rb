class DestinationsController < ApplicationController
    def index
        @destination = Destination.all
    end

    def show
        @destination = Destination.find_by(id: params[:id])
        @notes = @destination.notes.build(user_id: current_user.id)
    end
end
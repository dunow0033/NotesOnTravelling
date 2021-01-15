class DestinationsController < ApplicationController
    def index
        @destinations = Destination.all
    end

    def new
        @destination = Destination.new
    end

    def create
        
    end
end
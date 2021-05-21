class DestinationsController < ApplicationController

    def index
        @destinations = destination.all 
    end

    def show
        @destination = Destination.find(params[:id])
        @most_liked_post = Destination.find(params[:id]).most_liked_post
    end

    def create
        @new_destination = Destination.new(destination_params)
        
        if @new_destination.valid?
            @new_destination.save

            redirect_to destination_path(@new_destination)
        else  
            render :new
        end
    end

    def new
        @destination = Destination.new
    end

    def destination_params
        params.require(:destination).permit(:name, :country)
    end
end

class NotesController < ApplicationController
    def new
        @note = Note.new(user_id: session[:user_id], destination_id: params[:destination_id])
        @destination = @note.destination
    end
    
    def create
        @note = Note.create(note_params)
        
        if @note.save
            redirect_to destinations_path
        else
            redirect_to new_destination_note_path(@destination_id)
        end
    end
    
    def index
        if params[:destination_id]
            @destination = Destination.find_by(id: params[:destination_id])
            if @destination.nil?
                redirect_to destinations_path, alert: "Destination Not Found!!"
            else
                @notes = @destination.notes
                if @notes.empty?
                    @notes = "none"
                end
            end
        else
            @destination = Destination.find_by(id: params[:id])
            @notes = current_user.notes
            #binding.pry
        end
    end
    
    def edit
        @note = Note.find_by(id: params[:id])
    end
    
    def update
        @note = Note.find_by(id: params[:id])
        @note.update(note_params)
        redirect_to notes_path
    end

    def show
        @destination = Destination.find_by_id(params[:id])
        @notes = @destination.notes.build
    end

    def destroy
        Note.find(params[:id]).destroy
        flash[:notice] = "Note was successfully deleted!!"
        redirect_to destinations_path
    end
    
    private 
    
    def note_params 
        params.require(:note).permit(:content, :destination_id, :user_id)
    end 
end
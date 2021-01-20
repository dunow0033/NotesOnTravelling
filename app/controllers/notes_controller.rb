class NotesController < ApplicationController
    def new
        @note = Note.new
        @destination = @note.destination
    end
    
    def create
        @note = Note.create(note_params)
        redirect_to notes_path
    end
    
    def index
        if params[:destination_id]
            destination = Destination.find_by(id: params[:destination_id])
            if destination.nil?
                redirect_to destinations_path, alert: "Destination Not Found!!"
            else
                @notes = destination.notes
            end
        else
            @notes = current_user.notes
        end
    end
    
    def edit
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
    
    private 
    
    def note_params 
        params.require(:note).permit(:content, :destination_id, :user_id)
    end 
end
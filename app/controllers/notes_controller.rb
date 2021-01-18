class NotesController < ApplicationController
    def new
        @note = Note.new
    end
    
    def create
        @note = Note.create(note_params)
        redirect_to notes_path
    end
    
    def index
        @notes = Note.all
    end
    
    def edit
    end
    
    def update
        @note = Note.find_by(id: params[:id])
        @note.update(note_params)
        redirect_to notes_path
    end
    
    private 
    
    def attraction_params 
        params.require(:note).permit(:content, :destination_id, :user_id)
    end 
end
class NotesController < ApplicationController
    def new
        @note = Note.new
    end
    
    def create
        @note = Note.create(note_params)
        redirect_to note_path(@note)
    end
    
    def show
        @note = Note.find_by(id: params[:id])
    end
    
    def edit
        @note = @destination.notes.build(user_id: current_user.id)
    end
    
    def update
        @note = Note.find_by(id: params[:id])
        @note.update(note_params)
        redirect_to note_path(@note)
    end
    
    private 
    
    def attraction_params 
        params.require(:note).permit(:content, :destination_id, :user_id)
    end 
end
class NotesController < ApplicationController
    def new
        @note = Note.new(user_id: session[:user_id], destination_id: params[:destination_id])
        @destination = @note.destination
    end
    
    def create
        @note = Note.create(note_params)
        
        if @note.save
            destination = Destination.find_by(id: params[:note][:destination_id])
            flash[:notice] = "Note for " + destination.name + " was successfully created!!"
            redirect_to destinations_path
        else
            @destination_id = params[:note][:destination_id]
            render :new
        end
    end
    
    def index
        if params[:destination_id]
            @destination = Destination.find_by(id: params[:destination_id])
            @notes = @destination.notes
            if @notes.empty?
                @notes = "none"
            end
        else
            @notes = Note.all
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

    def destroy
        note = Note.find_by(id: params[:id])
        destination = note.destination
        Note.find(params[:id]).destroy
        flash[:notice] = "Note for " + destination.name + " was successfully deleted!!"
        redirect_to destinations_path
    end
    
    private 
    
    def note_params 
        params.require(:note).permit(:content, :destination_id, :user_id)
    end 
end
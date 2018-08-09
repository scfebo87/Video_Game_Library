class NotesController < ApplicationController
    
    def new
        @user = User.find_by(id: session[:user_id])
        @game = Game.find_by(id: params[:id])
        @note = Note.new(game_id: params[:id])
    end
    
    def create 
        @user = User.find_by(id: session[:user_id])
        @note = Note.new(note_params)
        if @note.save
            respond_to do |format|
                format.html {render :new}
                format.json {render json: @note.to_json(only: [:description])}
            end
        else
            redirect_to root_path
        end
    end
    
    private 
    
    def note_params
        params.require(:note).permit(:description, :game_id)
    end
    
end

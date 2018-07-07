class GamesController < ApplicationController

    def new
        if params[:user_id]
            @game = Game.new(user_id: params[:user_id], console_id: params[:console_id])
        else
            redirect_to root_path
        end
    end

    def create
        @user = User.find_by(id: session[:user_id])
        @game = Game.new(game_params)
        if @game.save
            redirect_to user_path(@user)
        else
            redirect_to new_user_console_game_path(@user, @console)
        end
    end


    def destroy
        Game.find(params[:id]).destroy
        redirect_to user_console_games_path(@user)
    end

    private

    def game_params
        params.require(:game).permit(:title, :user_id, :console_id)
    end
end

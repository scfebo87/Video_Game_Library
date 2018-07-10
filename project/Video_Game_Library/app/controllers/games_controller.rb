class GamesController < ApplicationController

    def new
        @user = User.find_by(id: params[:user_id])
        if @user && @user.id == session[:user_id]
            @game = Game.new(user_id: params[:user_id], console_id: params[:console_id])
        else
            redirect_to root_path
        end
    end

    def create
        @user = User.find_by(id: session[:user_id])
        @game = Game.new(game_params)
        if @game.save
            redirect_to user_consoles_path(@user)
        else
            redirect_to new_user_console_game_path(@user, @console)
        end
    end

    def edit
        @user = User.find_by(id: params[:user_id])
        if @user && @user.id == session[:user_id]
            @console = Console.find_by(id: params[:console_id])
            @game = Game.find(params[:id])
        else
            redirect_to root_path
        end
    end

    def update
        @user = User.find_by(id: session[:user_id])
        @game = Game.find(params[:id])
        @game.assign_attributes(game_params)
        if @game.save
            redirect_to user_consoles_path(@user)
        else
            render :edit
        end
    end

    def destroy
        Game.find(params[:id]).destroy
        @user = User.find_by(id: session[:user_id])
        redirect_to user_consoles_path(@user)
    end

    private

    def game_params
        params.require(:game).permit(:title, :user_id, :console_id)
    end
end

class ConsolesController < ApplicationController

    def index
        if params[:user_id]
            @user = User.find_by(params[:user_id])
            @consoles = @user.consoles
        else
            redirect_to root_path
        end
    end

    def new
        if params[:user_id]
            @console = Console.new
        else
            redirect_to root_path
        end
    end

    def create
        @user = User.find_by(id: session[:user_id])
        @console = Console.new(console_params)
        if @console.save
            redirect_to new_user_console_game_path(@user, @console)
        else
            redirect_to new_user_console_path
        end
    end

    def show
        @console = Console.find(params[:id])
    end

    def show2
        @console = Console.find(params[:id])
    end

    def destroy
        @user = User.find_by(id: session[:user_id])
        Console.find(params[:id]).destroy
        redirect_to user_consoles_path(@user)
    end

    private

    def console_params
        params.require(:console).permit(:company, :name, :model)
    end
end

class ConsolesController < ApplicationController

    def index
        if params[:id]
            @user = User.find_by(id: params[:user_id])
            @consoles = @user.consoles
        else
            @consoles = Console.all
        end
    end

    def new
        @console = Console.new
    end

    def create
        @user = User.find_by(id: session[:user_id])
        @console = Console.new(console_params)
        if @console.save
            redirect_to user_path(@user)
        else
            redirect_to new_console_path
        end
    end

    def show
        @console = Console.find(params[:id])
    end

    def destroy
        Console.find(params[:id]).destroy
        redirect_to consoles_path
    end

    private

    def console_params
        params.require(:console).permit(:company, :name, :model, :user_id)
    end
end

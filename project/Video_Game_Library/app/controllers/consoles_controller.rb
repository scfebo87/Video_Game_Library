class ConsolesController < ApplicationController

    def index
        @consoles = Console.all
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
        @user = User.find_by(id: params[:user_id])
         @console = Console.find(params[:id])
        if @user && @user.id == session[:user_id]
            render :show
        else
            redirect_to user_path(@user)
        end
    end

    private

    def console_params
        params.require(:console).permit(:company, :name, :model)
    end
end

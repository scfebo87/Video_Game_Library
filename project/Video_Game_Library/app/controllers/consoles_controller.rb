class ConsolesController < ApplicationController

    def index
    end

    def new
        if params[:user_id]
            @console = Console.new
        else
            redirect_to root_path
        end
    end

    def create
        @user = User.find(params[:id])
        @console = Console.new(console_params)
        if @console.save
            @user.consoles << @console
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    private

    def console_params
        params.require(:console).permit(:company, :name, :model)
    end
end

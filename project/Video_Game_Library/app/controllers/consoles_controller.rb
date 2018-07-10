class ConsolesController < ApplicationController

    def index
        if params[:user_id]
            if User.find(params[:user_id])
                @user = User.find(params[:user_id])
                @consoles = @user.consoles
            else
                redirect_to root_path
            end
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
            render :new
        end
    end

    def show
        @console = Console.find(params[:id])
        @user = User.find(params[:user_id])
        if @user && @console && @user.id == session[:user_id]
            @consoles = @user.consoles
        else
            redirect_to root_path
        end
    end


    def edit
        if params[:user_id]
            @console = Console.find(params[:id])
            @user = User.find(params[:user_id])
        else
            redirect_to user_consoles_path(@user)
        end
    end

    def update
        @user = User.find_by(id: session[:user_id])
        @console = Console.find(params[:id])
        @console.assign_attributes(console_params)
        if @console.save
            redirect_to user_consoles_path(@user)
        else
            render :edit
        end
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

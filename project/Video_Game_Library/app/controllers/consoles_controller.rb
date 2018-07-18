class ConsolesController < ApplicationController
    before_action :require_login

    def index
        @user = User.find(params[:user_id])
        @consoles = @user.consoles
         if @user && @user.id == session[:user_id]
             render :index
         else
             redirect_to root_path
         end
    end

    def new
        @user = User.find(params[:user_id])
        @console = Console.new
        if @user && @user.id == session[:user_id]
            render :new
        else
            redirect_to root_path
        end
    end

    def create
        @user = User.find_by(id: session[:user_id])
        @console = Console.new(console_params)
        if flash[:message]
            flash[:message].clear
        elsif @console.save
            redirect_to new_user_console_game_path(@user, @console)
        else
            flash[:message] = "Please fill out all fields"
            render :new
        end
    end

    def show
        @console = Console.find(params[:id])
        @user = User.find(params[:user_id])
        @consoles = @user.consoles
        if @user && @user.id == session[:user_id]
            render :show
        else
            redirect_to root_path
        end
    end


    def edit
        @console = Console.find(params[:id])
        @user = User.find(params[:user_id])
        if @user && @user.id == session[:user_id]
            render :edit
        else
            redirect_to root_path
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

    def most
        @user = User.find(params[:user_id])
        @consoles = @user.consoles
        if @user && @user.id == session[:user_id]
            render :most
        else
            redirect_to root_path
        end
    end

    private

    def console_params
        params.require(:console).permit(:company, :name, :model)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end

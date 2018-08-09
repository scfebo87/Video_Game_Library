class UsersController < ApplicationController

    def new
         @user = User.find_by(id: session[:user_id])
         if @user && @user.id == session[:user_id]
            redirect_to user_path(@user)
        else
            @user = User.new
         end
    end

    def create
        @user = User.new(user_params)
        if flash[:message]
            flash[:message].clear
        elsif @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Please fill out all fields"
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        if @user && @user.id == session[:user_id]
            render :show
        else
            redirect_to root_path
        end
    end
    
    def games 
        @user = User.find(session[:user_id])
        @games = @user.games
        if @user && @user.id == session[:user_id]
            respond_to do |format|
                format.html {render :games}
                format.json {render json: @games.to_json(only: [:title])}
            end
        else
            redirect_to root_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:user_name, :email, :password)
    end
end

class ApplicationController < ActionController::Base

    def index
        if params[:id]
        @user = User.find(session[:user_id])
        if @user && @user.id = session[:user_id]
            redirect_to user_path(@user)
        else
            render :index
        end
        else
            render :index
        end
    end
end

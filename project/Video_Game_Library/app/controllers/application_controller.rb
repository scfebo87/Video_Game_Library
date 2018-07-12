class ApplicationController < ActionController::Base

    def index
        @user = User.find_by(id: session[:user_id])
        if @user && @user.id == session[:user_id]
            redirect_to user_path(@user)
        else
            render :index
        end
    end
end

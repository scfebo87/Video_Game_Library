class ApplicationController < ActionController::Base

    def index
        @user = User.find(session[:user_id])
        if @user && @user.id = session[:user_id]
            redirect_to user_path(@user)
        else
            redirect_to root_path
        end
    end
end

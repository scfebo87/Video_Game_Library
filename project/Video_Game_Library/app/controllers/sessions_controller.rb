class SessionsController < ApplicationController

    def new
        @user = User.find_by(id: session[:user_id])
        if @user && @user.id == session[:user_id]
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Username or Password is Incorrect"
            render :new
        end
     end

     def destroy
        session.clear
        redirect_to '/'
    end
end

class FessionsController < ApplicationController
    def create
        @user = User.find_by(email: auth['info']['email'])
        if @user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @user = User.new(uid: auth['uid'], user_name: auth['info']['name'], email: auth['info']['email'], password: auth['uid'])
            if @user.save
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                redirect_to login_path
            end
        end
    end

  private

  def auth
    request.env['omniauth.auth']
  end
end


class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
        redirect_to users_path
        flash[:success] = "Welcome to the other side!"
      else 
        flash[:error] = "Password not valid. You shall not pass!"
      end
    else
      render "new"
    end
  end
end

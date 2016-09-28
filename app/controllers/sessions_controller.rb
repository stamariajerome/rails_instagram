class SessionsController < ApplicationController
  def create
    flash_message = flash.now[:danger] = ['Please check username/password']

    if user = User.find_by(:username => params[:session][:username])
      if user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to collections_path
      else
        flash_message
        render:new
      end
    else
      flash_message
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to collections_path
  end
end

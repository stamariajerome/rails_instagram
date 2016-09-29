class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to collections_path
    else
      flash[:danger] = @user.errors.full_messages
      redirect_to register_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :gender, :country);
  end
end

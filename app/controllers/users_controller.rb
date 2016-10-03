class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    logger.ap user_params.inspect

    # if @user.save
    #   redirect_to collections_path
    # else
    #   flash[:danger] = @user.errors.full_messages
    #   redirect_to register_path
    # end
  end

  def show
    # TODO Wrong maybe? can't get the usernames owner
    @collections = Collection.where(:user_id => params[:id])

    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :gender, :country_code)
  end
end

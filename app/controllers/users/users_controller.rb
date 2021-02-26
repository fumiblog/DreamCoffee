class Users::UsersController < ApplicationController
  def show
    @user = current_user
    # byebug
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :postal_code,
      :address,
      :telephone
    )
  end
  

end

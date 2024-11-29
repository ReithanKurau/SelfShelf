class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated!"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :age, :location, :bio, :avatar, tag_list: [])
  end

end

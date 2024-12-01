class UsersController < ApplicationController
  def index
    @user = current_user
    @related_users = @user.find_related_tags
  end

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

  def tagged
    if params[:tag].present?
      @users = User.tagged_with(params[:tag])
    else
      @user = User.all
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :age, :location, :bio, :photo, tag_list: [])
  end

end

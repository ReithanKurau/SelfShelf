class UsersController < ApplicationController
  def index
    @invitation = Invitation.new

    @related_users = current_user.find_related_tags

    @users = []
    if params[:query].present?
      @users = User.where('username ILIKE ?', "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'list', locals: { users: @users }, formats: [:html] }
    end

    @all_users = User.all
    # @shared_users = @all_users.joins(:shelf_interests).where("shelf_interests.interest_id =  ?", current_user.interests.first.id)
    @shared_users = []
    current_user.interests.each do |interest|
       users = @all_users.joins(:shelf_interests).where("shelf_interests.interest_id =  ?", interest.id)

       @shared_users << users.reject { |e| e == current_user }
    end

    @shared_users = @shared_users.uniq.flatten
  end

  def show
    @user = User.find(params[:id])
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
    params.require(:user).permit(:username, :age, :location, :bio, :photo, :style, tag_list: [])
  end
end

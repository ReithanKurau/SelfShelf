class ShelfInterestsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :index
  def index
    @user = User.find(params[:user_id])
    if params[:media_type].present?
      @interests = @user.interests.where(media_type: params[:media_type])
      @shelf_interests = @user.shelf_interests.select do |shelf_interest|
        shelf_interest.interest.media_type == params[:media_type]
      end
      render "shelf_filtered"
    else
      # @interests = current_user.interests.all
      @books = @user.interests.where(media_type: 'book')
      @movies = @user.interests.where(media_type: 'movie')
      @albums = @user.interests.where(media_type: 'album')

      render "index"
    end
  end

  def create
    @shelf_interest = ShelfInterest.new
    @interest = Interest.find(params[:shelf_interest][:interest_id])
    @shelf_interest.interest = @interest
    @shelf_interest.user = current_user

    if @shelf_interest.save
      redirect_to user_shelf_interests_path(current_user, :media_type => @interest.media_type)
    else
      raise # shouldnt ever get here
    end
  end

  def show
    @shelf_interest = ShelfInterest.find(params[:id])
    @comment = Comment.new
  end

  private

  def shelf_interest_params
    params.require(:shelf_interest).permit(:interest_id)
  end
end

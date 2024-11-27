class ShelfInterestsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :index
  def index
    if params[:media_type].present?
      @interests = current_user.interests.where(media_type: params[:media_type])
      render "shelf_filtered"
    else
      # @interests = current_user.interests.all
      @books = current_user.interests.where(media_type: 'book')
      @movies = current_user.interests.where(media_type: 'movie')
      @albums = current_user.interests.where(media_type: 'album')
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

  private

  # def shelf_interest_params
  #   params.require(:shelf_interest).permit(:interest_id)
  # end
end

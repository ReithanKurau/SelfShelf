class ShelfInterestsController < ApplicationController
  def index
    if params[:media_type].present?
      @interests = current_user.interests.where(media_type: params[:media_type])
      render "shelf"
    else
      render "index"
    end
    @interest = Interest.new
  end
end

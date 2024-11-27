class ShelfInterestsController < ApplicationController
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
end

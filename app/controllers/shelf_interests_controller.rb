class ShelfInterestsController < ApplicationController
  def index
    if params[:media_type].present?
      @shelf_interests = ShelfInterest.all
      @shelf_interests = @shelf_interests.map { |shelf_interest| shelf_interest.interest.where(media_type: params[:media_type]) }
    else
      @shelf_interests = ShelfInterest.all
    end
  end
end

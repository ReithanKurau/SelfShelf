class InterestsController < ApplicationController
  def index
    @shelf_interest = ShelfInterest.new
    if params[:query].present?
      @interests = Interest.search_by_title_creator_genre(params[:query])
    else
      @interests = Interest.all
    end
  end

  def show
    @interest = Interest.find(params[:id])
    @shelf_interest = ShelfInterest.new
    @comments = @interest.comments.includes(:user)
  end
end

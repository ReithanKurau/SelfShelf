class InterestsController < ApplicationController
  def index
    if params[:query].present?
      @interests = Interest.search_by_title_creator_genre
    else
      Interest.all
    end
  end
end
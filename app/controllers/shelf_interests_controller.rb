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

  def create
    #I seem to have shelf_interest passed in as a parameter from the form, but dont know how to read it
    # @interest = Interest.find(params[:shelf_interest])
    # raise
    # @shelf_interest = ShelfInterest.new
    # @shelf_interest.interest = @interest
    # @shelf_interest.user = current_user
    
    @shelf_interest = params[:shelf_interest]


    if @shelf_interest.save
      redirect_to user_self_interest_path(current_user)
    else
      raise # shouldnt ever get here
    end
  end
end

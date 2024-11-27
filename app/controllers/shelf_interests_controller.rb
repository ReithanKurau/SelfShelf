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
    @shelf_interest = ShelfInterest.new
    # @shelf_interest = ShelfInterest.new(shelf_interest_params)
    @interest = Interest.find(params[:shelf_interest][:interest_id])
    
    @shelf_interest.interest = @interest
    @shelf_interest.user = current_user

    if @shelf_interest.save
      redirect_to user_self_interests_path(current_user, :media_type => @interest.media_type)
    else
      raise # shouldnt ever get here
    end
  end

  # private 
  # def shelf_interest_params
  #   params.require(:shelf_interest).permit(:interest_id)
  # end
end

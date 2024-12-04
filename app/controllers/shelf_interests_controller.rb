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
    
    @favorite_books = @user.all_favorites.where(media_type: 'book')
    @favorite_movies = @user.all_favorites.where(media_type: 'movie')
    @favorite_albums = @user.all_favorites.where(media_type: 'album')

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
    @user = @shelf_interest.user
    @comment = Comment.new
  end

  def edit
    @shelf_interest = ShelfInterest.find(params[:id])
  end

  def update
    @shelf_interest = ShelfInterest.find(params[:id])
    if @shelf_interest.update(shelf_interest_params)
      redirect_to user_shelf_interest_path(current_user, @shelf_interest), notice: 'Journal was successfully updated.'
    else
      render 'shelf_interests/show', status: :unprocessable_entity
    end
  end


  def destroy
    @shelf_interest = ShelfInterest.find(params[:id])
    @shelf_interest.destroy
    redirect_to user_shelf_interest_path(current_user, @shelf_interest), status: :see_other
  end


  def favorite
    @shelf_interest = ShelfInterest.find(params[:id])
    current_user.favorite(@shelf_interest)
    redirect_to user_shelf_interest_path(current_user, @shelf_interest)
  end


  private

  def shelf_interest_params
    params.require(:shelf_interest).permit(:interest_id, :rich_journal)
  end

end

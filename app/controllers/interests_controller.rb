class InterestsController < ApplicationController
  def index
    @shelf_interest = ShelfInterest.new
    # if params[:query].present?
    #   @interests = Interest.search_by_title_creator_genre_description(params[:query])
    # else
    #   @interests = Interest.all
    # end
    if params[:query].present?
      @interests = []
      # @interests = MovieApiService.new(params[:query]).call
      @movies = MovieApiService.new(params[:query]).call
      @movies = []
      # @interests += BookApiService.new(params[:query]).call
      @books = BookApiService.new(params[:query]).call
      @albums = AlbumApiService.new(params[:query]).call
    
    else
      @interests = Interest.first(10)
    end
    respond_to do |format|
      format.html
      # format.text { render partial: 'list', locals: { interests: @interests, shelf_interest: @shelf_interest }, formats: [:html] }
      format.text { render partial: 'list', locals: { movies: @movies, books: @books, albums: @albums, interests: @interests, shelf_interest: @shelf_interest }, formats: [:html] }
    end
  end

  def show
    @interest = Interest.find(params[:id])
    @shelf_interest = ShelfInterest.new
    @comments = @interest.comments.includes(:user)
  end
end

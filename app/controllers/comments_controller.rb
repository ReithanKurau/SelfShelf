class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @shelf_interest = ShelfInterest.find(params[:shelf_interest_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.shelf_interest = @shelf_interest
    if @comment.save
      redirect_to [@shelf_interest.user, @shelf_interest], notice: 'Comment was successfully created.'
    else
      redirect_to [@shelf_interest.user, @shelf_interest], alert: 'Comment could not be created.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

class ShelfInterestsController < ApplicationController
  def index
    @interest = Interest.new
  end
end

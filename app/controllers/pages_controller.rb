class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    redirect_to user_shelf_interests_path(current_user) if user_signed_in?
  end
end

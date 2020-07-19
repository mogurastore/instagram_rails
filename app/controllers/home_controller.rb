class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @feeds = Photo.where(user_id: [current_user.id, *current_user.following_ids]).order(created_at: :desc)
  end
end

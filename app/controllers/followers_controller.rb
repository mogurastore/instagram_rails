class FollowersController < ApplicationController
  def index
    @followers = User.find(params[:user_id]).followers
  end
end

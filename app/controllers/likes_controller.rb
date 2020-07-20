class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def index
    @photos = Photo.joins(:likes).where(likes: { user_id: params[:user_id] })
  end

  def create
    current_user.likes.create(photo_id: params[:photo_id])

    redirect_to [:photo, { id: params[:photo_id] }]
  end

  def destroy
    current_user.likes.find_by(photo_id: params[:photo_id]).destroy

    redirect_to [:photo, { id: params[:photo_id] }]
  end
end

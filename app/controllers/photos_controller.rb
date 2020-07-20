class PhotosController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.new
  end

  def new
    @photo = current_user.photos.new
  end

  def create
    @photo = current_user.photos.new(photo_params)

    if @photo.save
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end
end

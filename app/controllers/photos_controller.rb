class PhotosController < ApplicationController
  def index
    @photo = Photo.all
  end
  def new
    @photo = Photo.new
  end
  def show
    photo = Photo.find_by(id: params[:id])
    render json: photo
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to "/"
    end
  end

  private

  def photo_params
    params.permit(:user_name,:user_id)
  end
end

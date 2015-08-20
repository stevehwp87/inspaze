class PhotosController < ApplicationController

before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
    @album = Album.find(params[:album_id])
    @photos = @album.photos.all
    @photo = @album.photos.new
  end

def new
@photo = Photo.New
end

  def create
    @album = Album.find(params[:album_id])
    @photo = @album.photos.new(photo_params)
    if @photo.save
      redirect_to album_photos_url
    else
      redirect_to album_photos_url
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(photo_params)
      redirect_to album_photos_url, notice: "photo was successfully updated."
    else
      render :index
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @album = @photo.album
    @photo.destroy
    redirect_to album_photos_url(@album), notice: "photo was successfully destroyed."

  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:name, :image, :tag_list, :album_id)
    end
end

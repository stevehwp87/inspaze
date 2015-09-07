class AlbumsController < ApplicationController
  before_action :authenticate_designer!, except: [:show]
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  # GET /albums
  # GET /albums.json
  def index

    @albums = current_designer.albums
    # @albums = Album.all
    @album = Album.new
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    # @photos = @album.photos.all
    # @photo = Photo.new
    @album = Album.find(params[:id])
    @photos = @album.photos
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    # @designer = current_designer
    @album = current_designer.albums.new(album_params)
    # @album = Album.new(album_params)
    # respond_to do |format|
      if @album.save
        redirect_to album_photos_path(@album.id)
        # format.html { redirect_to @album, notice: 'Album was successfully created.' }
        # # format.html { redirect_to album_photos_path, notice: 'Album was successfully created.' }
        # format.json { render :show, status: :created, location: @album }
        # format.js
      else
        render :new
        # format.html { render :new }
        # format.json { render json: @album.errors, status: :unprocessable_entity }
        # format.js
      end
    end
  # end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    @album = current_designer.albums.find(params[:id])
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title)
    end
end

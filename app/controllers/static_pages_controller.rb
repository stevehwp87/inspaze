class StaticPagesController < ApplicationController
  def home
  end

  def index
  	
  end

  def users_type
  end

  def designs

  	# @photos = Photo.all
   #  # @photo -Photo.find(params[:id])
    @user = current_user
    @photos = Photo.all.paginate(:page => params[:page], :per_page => 40)
    respond_to do |format|
      format.html
      format.json
      format.js 
    end
  end

  def products
  
  end

  def unlike
    @photo = Photo.find(params[:id])
    @photo.unliked_by current_user
    respond_to do |format|
      format.js 
    end
  end

  def like
    @photo = Photo.find(params[:id])
    @photo.liked_by current_user
    respond_to do |format|
      format.js 
    end
  end

end

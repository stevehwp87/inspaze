class StaticPagesController < ApplicationController
  def home
  end

  def index
  	
  end

  def users_type
  end

  def designs
  	@photos = Photo.all
  	
  end

  def products
  	@photos = Photo.all
  	@photo = Photo.find(params[:id])
  end



end

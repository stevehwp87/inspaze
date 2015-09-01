class StaticPagesController < ApplicationController
  def home
  end

  def index
  	
  end

  def users_type
  end

  def designs

  	@photos = Photo.all
    # @photo -Photo.find(params[:id])
    @user = current_user
  end

  def products
  
  end



end

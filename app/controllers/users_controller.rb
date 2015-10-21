require 'will_paginate/array'

class UsersController < ApplicationController

before_action :authenticate_user! 


  def show
    @user = User.find(params[:id]) 
    @user = current_user
  end

  def edit
		@user = User.find(params[:id])
		@user = current_user
	end

	def update
		@user = User.find(params[:id])
		@user = current_user
		if @user.update_attributes(user_params)
		render 'show'
		else
		render 'edit'
		end
	end

	def ideabook

		@user = current_user
		@liked_photos = @user.find_liked_items.paginate(:page => params[:page], :per_page => 40)
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

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name,
		:date_of_birth, :gender,:state, :country, :phone_no, :admin)
	end

end

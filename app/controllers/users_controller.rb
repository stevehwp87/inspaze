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

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name,
		:date_of_birth, :gender,:state, :country, :phone_no, :admin)
	end

end

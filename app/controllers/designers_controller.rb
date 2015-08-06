class DesignersController < ApplicationController
before_action :authenticate_designer!

  def show
    @designer = Designer.find(params[:id]) 
    @designer = current_designer
  end

  def edit
		@designer = Designer.find(params[:id])
		@designer = current_designer
	end

	def update
		@designer = Designer.find(params[:id])
		@designer = current_designer
		if @designer.update_attributes(designer_params)
		render 'show'
		else
		render 'edit'
		end
	end

	private

	def designer_params
		params.require(:designer).permit(:first_name, :last_name,
		:date_of_birth, :gender,:state, :country, :phone_no)
	end

end

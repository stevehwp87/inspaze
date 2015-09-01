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
		redirect_to designer_path
		else
		render 'edit'
		end
	end

	def profile

	  @designer = Designer.find(params[:id])
	  @albums = @designer.albums

	end

	def gallery
	  @designer = Designer.find(params[:id])
	end

	private

	def designer_params
		params.require(:designer).permit(:first_name, :last_name,
		:date_of_birth, :gender, :phone_no, :company_name, :address, :country, :years_in_business, :profession, :position, :display_name, :display_email, :display_contact, :website, :business_description)
	end

end

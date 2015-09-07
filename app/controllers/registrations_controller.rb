class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    case resource.class
	    when User
	      edit_user_path(user)
	    when Designer
	      edit_designer_path(designer)
    end
  end

  # def after_sign_up_path_for(user)
  #   edit_user_path(user)
  # end

end
class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource.class == User
      edit_user_path(resource)
    elsif resource.class == Designer
      edit_designer_path(resource)
    end
  end

end
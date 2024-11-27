class RegistrationsController < Devise::RegistrationsController
  def after_sign_in_path_for(resource)
    user_shelf_path(resource)
  end

  def after_sign_up_path_for(resource)
   edit_user_path(resource)
  end
end

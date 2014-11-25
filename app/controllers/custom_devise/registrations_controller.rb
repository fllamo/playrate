class CustomDevise::RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    edit_player_profile_path(resource.player_profile)
  end

  def sign_up_params
    params.require(resource_name).permit(:name, :email, :password, :password_confirmation, :player_sign_up)
  end

end
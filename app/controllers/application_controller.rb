class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  private

  def after_sign_in_path_for(resource)
    pages_account_redirect_path
  end

  def authenticate_admin!
    redirect_to new_user_session_path unless current_user.is_admin?
  end
end

class PagesController < ApplicationController

  skip_before_filter :authenticate_user!

  def account_redirect
    if current_user
      if current_user.is_admin?
        redirect_to admin_recruiters_path
      elsif current_user.is_player?
        redirect_to player_profile_path(current_user.player_profile)
      elsif current_user.is_recruiter?
        redirect_to dashboard_index_path
      end
    else
      redirect_to root_path
    end
  end

  def landing
    render layout: 'landing'
  end
end

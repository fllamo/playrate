class DashboardController < ApplicationController
  def index
    authorize! :read, :dashboard
    all_players = PlayerProfile.joins(:conversations).where('conversations.recruiter_profile_id = ?', current_user.profile.id)
    no_interests = PlayerProfile.joins(:note_books).where('note_books.recruiter_profile_id = ? AND note_books.status = ?', current_user.profile.id, 'No Interest')
    @players = all_players - no_interests
  end

  def add_to_dash
    authorize! :update, :dashboard
    player = PlayerProfile.find(params[:profile_id])
    @conversation = current_user.profile.conversations.find_or_create_by(player_profile: player)
    redirect_to :back, notice: 'Added player to Dashboard'
  end
end

class TeamsController < ApplicationController
  def create
    @team = Team.new(team_params)
    @team.player_profile = current_user.player_profile
    authorize! :manage, @team
    @team.save
    respond_to do |format|
      format.js
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :varsity, :duration, :coach, :coach_phone, :coach_email, :jersey_number)
  end
end

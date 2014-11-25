class PositionsController < ApplicationController

  def index
    @positions = Sport.find(params[:sport_id]).positions
    render layout: false
  end

  def player_form
    @player_profile = PlayerProfile.find(params[:player_profile_id])
    @position = Position.find(params[:position_id])
    render layout: false
  end
end

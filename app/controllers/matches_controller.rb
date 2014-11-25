class MatchesController < ApplicationController
  def index
    @searches = current_user.profile.position_searches
    authorize! :read, PositionSearch
    if params[:search_id]
      @active_search = PositionSearch.find(params[:search_id])
      @matches = Match.where(position_search: @active_search).order(total_score: :desc)
      @matches.unseen.update_all(seen: true)
    end
  end

  def destroy
    @match = Match.find(params[:id])
    authorize! :manage, @match
    @match.destroy
    redirect_to matches_path({search_id: @match.position_search.id}), notice: 'Match was removed from search results'
  end
end

class PositionSearchesController < ApplicationController
  def new
    @position_search = PositionSearch.new
  end

  def position_search_form
    @position_search = PositionSearch.new
    @position = Position.find(params[:position_id])
    render layout: false
  end

  def create
    @position_search = PositionSearch.new(position_searches_params)
    @position_search.recruiter_profile = current_user.profile
    authorize! :manage, @position_search
    if @position_search.save
      PlayerProfile.where(position: @position_search.position).each do |player|
        @position_search.match_against!(player)
      end
      redirect_to matches_path({search_id: @position_search.id}), notice: 'Saved new search'
    else
      flash.now[:alert] = @position_search.errors.full_messages.join(' / ')
      render :new
    end
  end

  def edit
    @position_search = PositionSearch.find(params[:id])
    authorize! :manage, @position_search
  end

  def destroy
    @position_search = PositionSearch.find(params[:id])
    authorize! :manage, @position_search
    @position_search.destroy
    redirect_to matches_path, notice: "Removed saved search '#{@position_search.name}'"
  end

  def position_searches_params
    params.require(:position_search).permit!
  end

end

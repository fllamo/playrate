class PlayerProfilesController < ApplicationController
  def index
  end

  def show
    @player_profile = PlayerProfile.find(params[:id])
    if @player_profile.complete?
      if current_user.is_recruiter?
        note_book = @player_profile.note_books.where(recruiter_profile: current_user.profile).first
        @recruiter_status = note_book && note_book.status
        @recruiter_notes = note_book && note_book.notes
      end
      params[:show] ||= 'about'
      render :show
    else
      redirect_to edit_player_profile_path(@player_profile)
    end
  end

  def edit
    @player_profile = PlayerProfile.find(params[:id])
    authorize! :manage, @player_profile
    params[:form] ||= 'account'
  end

  def update
    @player_profile = PlayerProfile.find(params[:id])
    authorize! :manage, @player_profile
    
    # Like a regular update
    if @player_profile.complete?

      # add player to searches unless he already has been
      PositionSearch.where(position: @player_profile.position).each do |search|
        search.match_against!(@player_profile) unless search.matches.exists?(player_profile: @player_profile)
      end

      if params[:player_profile].blank?
        redirect_to player_profile_path(@player_profile)
      else
        if @player_profile.update_attributes(player_profile_params)
          redirect_to player_profile_path(@player_profile), notice: 'Updated account details'
        else
          if params[:form] == 'stats'
            flash.now[:alert] = "If you don't fill out all of your stats, we'll just zeros - please make sure that's ok!"
          end
          render :edit
        end
      end
    else
      # More like a multistep create
      current_step = @player_profile.completion_step
      @player_profile.update_attributes(player_profile_params) unless params[:player_profile].blank?
      # if profile is complete after update
      if @player_profile.complete?
        redirect_to player_profile_path(@player_profile)
      # if step has changed after update
      elsif current_step == @player_profile.completion_step
        flash.now[:alert] = "You need to give us a bit more information before we can continue."
        render :edit
      else
        redirect_to edit_player_profile_path(@player_profile), notice: 'Updated account details'
      end
    end
  end

  private

  def player_profile_params
    params.require(:player_profile).permit!
  end
end

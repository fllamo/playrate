class HighlightsController < ApplicationController
  def create
    @highlight = Highlight.new(highlight_params)
    @highlight.player_profile = current_user.player_profile
    authorize! :manage, @highlight
    @highlight.save
    respond_to do |format|
        format.js
    end
  end

  def destroy
    @highlight = Highlight.find(params[:id])
    authorize! :manage, @highlight
    @highlight.destroy
    respond_to do |format|
        format.js
    end
  end

  private

  def highlight_params
    params.require(:highlight).permit(:custom_title, :video_url)
  end
end

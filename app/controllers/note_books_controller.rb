class NoteBooksController < ApplicationController

  before_action do
    @player_profile = PlayerProfile.find(params[:player_profile_id])
    @note_book = @player_profile.note_books.first_or_create(recruiter_profile: current_user.profile)
  end

  def edit
    authorize! :manage, @note_book
    render :edit
  end

  def update
    authorize! :manage, @note_book
    if @note_book.update_attributes(note_book_params)
      redirect_to player_profile_path(@player_profile)
    else
      render :edit
    end
  end

  private

  def note_book_params
    params.require(:note_book).permit(:status, :notes)
  end
end

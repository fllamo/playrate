# TODO: Meh
class ConversationsController < ApplicationController

  def index
    authorize! :read, :conversations
    if current_user.is_player?
      @conversations = Conversation.where(player_profile: current_user.profile)
    elsif current_user.is_recruiter?
      @conversations = Conversation.where(recruiter_profile: current_user.profile)
    end
  end

  def show
    authorize! :read, :conversations
    if current_user.is_player?
      @player_profile = current_user.profile
      @conversation = current_user.profile.conversations.find_or_create_by(recruiter_profile_id: params[:profile])
    elsif current_user.is_recruiter?
      @player_profile = PlayerProfile.find(params[:profile])
      @conversation = current_user.profile.conversations.find_or_create_by(player_profile: @player_profile)
    end
  end

  def update
    # insert current user to message user id
    if params[:conversation] && params[:conversation][:messages_attributes]
      params[:conversation][:messages_attributes].each do |key, message|
        message[:user_id] = current_user.id
      end
    end

    @conversation = Conversation.find(params[:id])
    authorize! :update, @conversation

    if current_user.is_player?
      other_profile = @conversation.recruiter_profile
    elsif current_user.is_recruiter?
      other_profile = @conversation.player_profile
    end

    if @conversation.update_attributes(conversation_params)
      UserMailer.new_message_notification(other_profile, current_user.profile, @conversation).deliver
      redirect_to show_conversations_path(profile: other_profile.to_param), notice: 'Message sent'
    else
      render :show
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(messages_attributes: [:user_id, :body])
  end
end

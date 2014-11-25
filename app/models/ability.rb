class Ability
  include CanCan::Ability

  # lock down obvious stuff

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.is_player?
      can :read, :conversations
      can :update, Conversation, player_profile_id: user.profile.id
      can :manage, Highlight, player_profile_id: user.profile.id
      can :manage, PlayerProfile, id: user.profile.id
      can :submit, School
      can :manage, Team, player_profile_id: user.profile.id
    elsif user.is_recruiter?
      can :read, :conversations
      can :update, Conversation, recruiter_profile_id: user.profile.id
      can [:read, :update], :dashboard
      can :read, PositionSearch, recruiter_profile_id: user.profile.id
      can :manage, PositionSearch, recruiter_profile_id: user.profile.id
      can :manage, Match do |match|
        match.position_search.recruiter_profile_id == user.profile.id
      end
      can :manage, NoteBook, recruiter_profile_id: user.profile.id
    end
  end
end

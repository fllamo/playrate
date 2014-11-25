class UserMailer < ActionMailer::Base
  default from: 'evan@playrate.me'

  def welcome_private_beta_recruiter(user, password)
    @user = user
    @generated_password = password
    @login_url = new_user_session_path(only_path: false)
    mail(to: @user.email, subject: "Welcome to Playrate's private beta")
  end

  def request_testimonial(testimonial)
    @testimonial = testimonial
    @edit_testimonial_path = edit_testimonial_path(@testimonial.sid, only_path: false)
    @player_name = @testimonial.team.player_profile.user.name
    mail(to: @testimonial.team.coach_email, subject: "#{@player_name} has requested a testimonial from you on Playrate")
  end

  def testimonial_received(team)
    @team = team
    mail(to: @team.player_profile.user.email, subject: "#{@team.coach} has submitted a testimonial to your Playrate profile")
  end

  def new_school_submission(to_emails, school, player_profile, score = nil)
    @school = school
    @player_profile = player_profile
    @player_profile_path = player_profile_path(@player_profile, only_path: false)
    @score = score
    mail(to: to_emails, subject: "#{@player_profile.user.name} has submitted their Playrate profile to #{@school.name}")
  end

  def new_message_notification(from_profile, to_profile, conversation)
    @from = from_profile
    @to = to_profile
    @conversation_path = conversations_path(profile: @from, only_path: false)
    mail(to: @to.user.email, subject: "You have a new message on Playrate from #{@from.user.name}")
  end
end

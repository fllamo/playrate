class SchoolsController < ApplicationController
  def index
    if params[:q].present?
      if params[:enrollement_size] == 'small'
        params[:q][:enrollement_size_gt] = nil
        params[:q][:enrollement_size_lt] = 2000
      elsif params[:enrollement_size] == 'medium'
        params[:q][:enrollement_size_gteq] = 2000
        params[:q][:enrollement_size_lteq] = 15000
      elsif params[:enrollement_size] == 'large'
        params[:q][:enrollement_size_gt] = 15000
        params[:q][:enrollement_size_lt] = nil
      end
    end

    @q = School.search(params[:q])
    @schools = @q.result(distinct: true).order(:name)
    render :index, layout: !request.xhr?
  end

  def my
    @schools = current_user.profile.schools
  end

  def submit
    @school = School.find(params[:school_id])
    authorize! :submit, @school
    unless @school.submitted_to_by(current_user.profile)
      coaches_for_sport = @school.recruiter_profiles.where(sport: current_user.profile.sport).map(&:user)
      score = nil
      if coaches_for_sport.any?
        @school.position_searches.each do |search|
          if search.position == current_user.profile.position
            score = search.matches.first.search_score if search.matches.any?
          end
        end 
      UserMailer.new_school_submission(coaches_for_sport.map(&:email), @school, current_user.profile, score).deliver
      else
        # Right now, just send Evan all emails
        UserMailer.new_school_submission("evan.whelchel@gmail.com", @school, current_user.profile).deliver
        # Send emails to the right coaches by sport
        # sport_emails = @school.contacts.split(',').select{|contact| contact[/#{current_user.profile.sport.name}:/]}.join(',')
        # sport_emails = sport_emails.gsub(/#{current_user.profile.sport.name}:/, '') unless sport_emails.blank?
        # UserMailer.new_school_submission(sport_emails, @school, current_user.profile).deliver if @school.contacts.present?
      end
      Submission.create(player_profile: current_user.profile, school: @school)
    end

    respond_to do |format|
      format.js
    end
  end
end

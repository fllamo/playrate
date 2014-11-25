class TestimonialsController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:edit, :update]

  def create
    @testimonial = Testimonial.first_or_initialize(team_id: params[:team_id])
    if @testimonial.new_record?
      @testimonial.sid = SecureRandom.uuid
      @testimonial.save
    end
    UserMailer.request_testimonial(@testimonial).deliver
    respond_to do |format|
      format.js
    end
  end

  def edit
    @testimonial = Testimonial.find_by_sid(params[:id])
  end

  def update
    @testimonial = Testimonial.find_by_sid(params[:id])

    if testimonial_params[:body].present? && @testimonial.update_attributes(testimonial_params)
      UserMailer.testimonial_received(@testimonial.team).deliver
      redirect_to root_path, notice: 'Thank you for leaving that testimonial!'
    else
      flash.now[:alert] = 'The testimonial field is blank!'
      render :edit
    end
  end

  private

  def testimonial_params
    params.require(:testimonial).permit(:body)
  end
end

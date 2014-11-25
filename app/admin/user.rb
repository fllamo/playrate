require 'securerandom'

ActiveAdmin.register User, as: "Recruiter" do

  config.filters = false

  controller do
    def scoped_collection
      User.joins(:recruiter_profile)
    end

    def permitted_params
      params.permit!
    end

    def create
      @resource = User.new(permitted_params[:user])
      password = SecureRandom.hex(8)
      @resource.password = @resource.password_confirmation = password
      if @resource.save
        UserMailer.welcome_private_beta_recruiter(@resource, password).deliver
        redirect_to admin_recruiter_path(@resource)
      else
        render :edit
      end
    end

    def update_resource(object, attributes)
      update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
      object.send(update_method, *attributes)
    end
  end

  index do
    column :name
    column :email
    column :sport
    column :school
    actions
  end

  form do |f|
    f.inputs "Account" do
      f.input :name
      f.input :email
      f.input :password, label: "Password (auto-generated for new users)"
      f.input :password_confirmation, label: "Password Confirmation"
    end

    f.inputs "Details", for: [:recruiter_profile, f.object.profile || RecruiterProfile.new] do |profile_form|
      profile_form.input :sport
      profile_form.input :school
    end

    f.actions
  end

  show do |user|
    attributes_table do
      row :name
      row :email
      row :sport do
        user.profile.sport.name
      end
      row :school do
        user.profile.school
      end
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
    end
  end

end

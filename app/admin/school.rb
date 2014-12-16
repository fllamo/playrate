ActiveAdmin.register School do

  config.filters = false
  config.sort_order = "name_asc"

  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    selectable_column
    column :name
    column :image_url
    column :image_uploaded
    column :public
    column :location
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :image_uploaded
      f.input :division, collection: School.divisions
      f.input :conference, collection: School.conferences
      f.input :public, label: "Public school"
      f.input :state
      f.input :city
      f.input :website
      f.input :avg_sat_reading_starts_at
      f.input :avg_sat_reading_ends_at
      f.input :avg_sat_math_starts_at
      f.input :avg_sat_math_ends_at
      f.input :avg_sat_writing_starts_at
      f.input :avg_sat_writing_ends_at
      f.input :avg_act_composite_starts_at
      f.input :avg_act_composite_ends_at
      f.input :avg_gpa
      f.input :enrollement_size
      f.input :contacts
      f.input :sports
      f.actions
    end
  end

  # CSV imports

  action_item :only => :index do
    link_to 'Upload CSV', :action => 'upload_csv'
  end

  collection_action :upload_csv do
    render "admin/csv/upload_csv"
  end

  collection_action :import_csv, :method => :post do
    School.csv_to_db(params[:dump][:file])
    redirect_to :action => :index, :notice => "CSV imported successfully!"
  end

end

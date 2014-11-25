class AddSchoolIdToRecruiterProfile < ActiveRecord::Migration
  def change
    remove_column :recruiter_profiles, :school, :string
    add_reference :recruiter_profiles, :school, index: true
  end
end

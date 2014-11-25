# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :school do
    name "MyString"
    conference "MyString"
    division "MyString"
    public false
    state "MyString"
    city "MyString"
    website "MyString"
    avg_sat_reading_start 1
    avg_sat_reading_end 1
    avg_sat_math_start 1
    avg_sat_math_end 1
    avg_sat_writing_start 1
    avg_sat_writing_end 1
    avg_act_composite_start 1
    avg_act_composite_end 1
    avg_gpa 1.5
    enrollement_size 1
    recruiter_profile nil
  end
end

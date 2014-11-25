# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :position_search do
    recruiter_profile nil
    sport nil
    position nil
    name "MyString"
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note_book do
    player_profile nil
    recruiter_profile nil
    notes "MyText"
    status "MyString"
  end
end

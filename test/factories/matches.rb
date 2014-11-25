# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match do
    search_score 1
    total_score 1
    position_search nil
    player_profile nil
  end
end

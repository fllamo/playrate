# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tier do
    importance 1
    start_value 1.5
    end_value 1.5
    stat_search nil
  end
end

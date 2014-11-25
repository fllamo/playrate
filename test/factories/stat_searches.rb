# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stat_search do
    name "MyString"
    position_search nil
    coefficient 1
  end
end

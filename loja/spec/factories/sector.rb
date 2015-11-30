FactoryGirl.define do
  factory :sector do
    sequence(:title) { |n| "Sector #{n}" }
  end
end
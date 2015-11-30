FactoryGirl.define do
  factory :operator do
    sequence(:name) { |n| "Operator #{n}" }
    sequence(:email) { |n| "operator#{n}@email.teste".to_s}
    password 123321
    password_confirmation 123321
    sector
  end
end
FactoryBot.define do
  factory :purchase_order do
    price 200
    association :user
  end
end

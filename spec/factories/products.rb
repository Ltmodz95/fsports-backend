FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    base_price { 100 }
    description { "A test product" }
    in_stock { true }
    association :category
  end
end

FactoryBot.define do
  factory :price_adjustment do
    first_option_id { 1 }
    second_option_id { 1 }
    price { "9.99" }
  end
end

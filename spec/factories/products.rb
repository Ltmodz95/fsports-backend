FactoryBot.define do
  factory :product do
    name { "MyString" }
    base_price { "9.99" }
    in_stock { false }
    description { "MyString" }
    category { nil }
  end
end

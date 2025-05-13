FactoryBot.define do
  factory :option do
    name { "MyString" }
    price { 9.99 }
    in_stock { true }
    component { nil }
  end
end

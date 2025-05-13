FactoryBot.define do
  factory :cart_item do
    cart { nil }
    product { nil }
    selected_options { "" }
  end
end

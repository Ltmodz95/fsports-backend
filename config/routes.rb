Rails.application.routes.draw do
  resources :price_adjustments
  resources :incompatablity_rules
  resources :options
  resources :components
  resources :products
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  post "options/check_compatibility", to: "options#check_compatibility"
  post "products/calculate_product_price", to: "products#calculate_product_price"
end

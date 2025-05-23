Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :session do
        get :verify
      end
      resources :passwords, param: :token
      resources :cart_items
      resources :carts
      resources :categories
      resources :components
      resources :options
      resources :products do 
        resources :price_adjustments
        resources :incompatablity_rules
      end

      post "options/check_compatibility", to: "options#check_compatibility"
      post "products/calculate_product_price", to: "products#calculate_product_price"
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

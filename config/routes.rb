Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :session do
        get :verify
      end
      resources :passwords, param: :token
      resources :cart_items
      resource :cart, only: [:show]
      resources :price_adjustments
      resources :options
      resources :components
      resources :products do 
      resources :incompatablity_rules
      end
      resources :categories

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

Rails.application.routes.draw do
  get 'static_pages/privacy_policy'
  get 'static_pages/terms_of_service'
  devise_for :user,
        controllers: {
          omniauth_callbacks: 'users/omniauth_callbacks'
        }
  get 'home/index'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root 'home#index'
  # Defines the root path route ("/")
  # root "posts#index"
end

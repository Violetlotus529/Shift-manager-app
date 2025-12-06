Rails.application.routes.draw do
  root 'shifts#index'
  resources :shifts

  get "up" => "rails/health#show", as: :rails_health_check
end

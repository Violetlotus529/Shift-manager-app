Rails.application.routes.draw do
  root 'shifts#index'
  resources :shifts do
    get :index
  end

  get "up" => "rails/health#show", as: :rails_health_check
end

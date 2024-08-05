Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
 
  get "up" => "rails/health#show", as: :rails_health_check

  devise_scope :admin do
    root to: "devise/sessions#new"
  end

  namespace :admin do
    resources :product_categories do
      resources :products
    end
  end
end

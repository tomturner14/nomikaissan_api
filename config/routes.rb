Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events, only: [:index, :show, :create, :update, :destroy]
    end
  end

  root 'application#hello'
  get "up" => "rails/health#show", as: :rails_health_check
end

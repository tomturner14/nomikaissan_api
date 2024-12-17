Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events, only: [:index, :show, :create, :update, :destroy] do
        member do
          post 'attendances', to: 'events#create_attendance'
        end
      end
    end
  end
end

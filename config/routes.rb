Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :fields, only: [:index, :show, :create, :update, :destroy] do
        resources :hours, only: [:create, :destroy]
        resources :bookings, only: [:create]
      end
      resources :reservations, only: [:index, :show]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

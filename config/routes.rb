Rails.application.routes.draw do
  root to: "profiles#edit"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :workouts, only: [:index, :show] do
    member do
      get 'overview'
      get 'description'
    end
  end

  resource :profile, only: [:edit, :update, :show]

  get "home", to: "pages#home"
end

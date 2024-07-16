Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: "profiles#edit"
  resources :workouts, only: [:index, :show]

  resource :profile, only: [:edit, :update, :show]

  resources :workouts, only: [] do
    member do
      get 'summary'
    end
  end

  get "home", to:"pages#home"
end

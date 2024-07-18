Rails.application.routes.draw do
  root to: "profiles#edit"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :workouts, only: %i[index show create] do
    member do
      get 'overview'
      get 'description'
      get 'summary'
      post 'complete'
    end

    resources :workout_exercises, only: %i[show]
  end

  resource :profile, only: %i[edit update show] do
    member do
      get 'profile_dashboard'
    end
  end

  resources :group_classes, only: [:show]
  get "home", to: "pages#home"

end

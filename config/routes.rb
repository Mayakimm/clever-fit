Rails.application.routes.draw do
  get 'events/new'
  get 'events/create'
  get 'events/index'
  get 'events/show'
  root to: "profiles#edit"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }


  resources :workouts, only: %i[index create] do
    member do
      get 'overview'
      get 'description'
      get 'summary'
      post 'complete'
      patch 'start'
    end
  end

  resources :workout_exercises, only: %i[show] do
    member do
      post 'next_set'
      patch 'stop'
    end
  end

  resource :profile, only: %i[edit update show] do
    member do
    end
  end
  resources :group_classes, only: [:show]
get 'home', to: 'pages#home', as: 'home'
end

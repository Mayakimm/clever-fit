Rails.application.routes.draw do
  get 'events/new'
  get 'events/create'
  get 'events/index'
  get 'events/show'
  root to: "profiles#edit"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :events, only: [:index]

  resources :workouts, only: %i[index show create delete] do
    member do
      get 'overview'
      get 'description'
      get 'summary'
      post 'complete'
      patch 'start'
      patch 'freestyle_start'
      get 'freestyle'
      post 'add_exercise'
      delete 'remove_exercise'
    end
  end

  resources :workout_exercises, only: %i[show create] do
    member do
      post 'next_set'
      patch 'stop'
      patch 'update_last_time'
      get 'freestyle_show'
    end
  end

  resources :exercises, only: [:index, :show]

  resource :profile, only: %i[edit update show] do
    member do
    end
  end
  resources :group_classes, only: [:show]
  get 'home', to: 'pages#home', as: 'home'
end

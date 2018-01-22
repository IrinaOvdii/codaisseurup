Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  resources :events, except: [:destroy] do
   resources :registrations, only: [:create]
  end
  resources :profiles, only: [:new, :edit, :create, :update]
  resources :photos, only: [:destroy]


  get "about" => "pages#about"

  namespace :api do
    resources :events do
      resources :registrations
    end
  end

end

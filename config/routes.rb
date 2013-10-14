SimpleShowcaseAdmin::Engine.routes.draw do
  root to: 'categories#index'

  match '/login' => 'sessions#new', :as => 'login'
  get 'logout' => 'sessions#destroy', :as => 'logout'

  resources :categories do
    resources :items
  end
  resources :details
  resources :sessions
  resources :password_resets, path: 'password-reset', as: 'password_resets'
end

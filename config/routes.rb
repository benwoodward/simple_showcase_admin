SimpleShowcaseAdmin::Engine.routes.draw do
  root to: 'categories#index'

  match '/login' => 'sessions#new', :as => 'login'
  get 'logout' => 'sessions#destroy', :as => 'logout'

  match 'settings', to: 'settings#update', as: 'settings', via: [:put]
  match 'settings', to: 'settings#index', as: 'settings', via: [:get, :put]

  resources :categories do
    post :sort, on: :collection
    resources :items do
      post :sort, on: :collection
    end
  end
  resources :pages do
    post :sort, on: :collection
  end

  resources :details
  resources :sessions
  resources :password_resets, path: 'password-reset', as: 'password_resets'
end

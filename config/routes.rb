SimpleShowcaseAdmin::Engine.routes.draw do
  root to: 'categories#index'

  match '/login' => 'sessions#new', :as => 'login'
  get 'logout' => 'sessions#destroy', :as => 'logout'

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

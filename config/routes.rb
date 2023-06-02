Rails.application.routes.draw do
  # root "articles#index"

  post '/admin/login', to: 'admins#login'
  resources :admins, only: [:index, :create]

  resources :merchants, only: [:index, :create, :destroy, :show, :update] do
    resources :transactions, only: [:index, :create, :destroy, :show, :update]
  end
end

Rails.application.routes.draw do
  resources :users do
    resources :subs, only: [:new, :create]
  end

  resources :subs, except: [:new, :create] do
    resources :posts, only: [:new, :create]
  end

  resource :session

  resources :posts, except: [:new, :create, :index, :destroy]
end

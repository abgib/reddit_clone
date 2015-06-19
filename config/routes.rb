Rails.application.routes.draw do
  resources :users do
    resources :subs, only: [:new, :create]
  end

  resources :subs, except: [:new, :create]

  resource :session
end

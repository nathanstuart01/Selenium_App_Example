Rails.application.routes.draw do
  root 'beers#index'

  resources :beers, except: [:new]
  devise_for :users

end

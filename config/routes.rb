Rails.application.routes.draw do
  devise_for :users
  root 'weddings#index'

  resources :weddings do
    resources :guests
  end

end

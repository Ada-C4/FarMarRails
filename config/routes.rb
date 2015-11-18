Rails.application.routes.draw do

  root 'markets#index'

  resources :markets do
    resources :vendors
  end

  resources :vendors do
    resources :products
    resources :sales
  end

end

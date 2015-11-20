Rails.application.routes.draw do
  root 'markets#index'
  resources :markets do

  end
  resources :vendors do
    resources :products do
      resources :sales
    end
    resources :sales, only: [:index]
  end
end

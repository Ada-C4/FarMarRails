Rails.application.routes.draw do
  root 'markets#index'
  resources :markets do

  end
  resources :vendors do
    resources :products do
    end
    resources :sales
  end
end

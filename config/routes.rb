Rails.application.routes.draw do
  root 'markets#home'
  resources :markets do

  end
  resources :vendors do
    resources :products do
    end
    resources :sales
  end
end

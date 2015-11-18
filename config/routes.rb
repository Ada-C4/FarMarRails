Rails.application.routes.draw do

  root 'welcome#index'

  get 'welcome/market' => 'welcome#show'

  resources :markets do
    resources :vendors
  end

  resources :vendors do
    resources :products
    resources :sales
  end

end

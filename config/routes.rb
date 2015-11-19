Rails.application.routes.draw do

  root 'welcome#index'

  get 'welcome/market' => 'welcome#show'

  resources :markets do
    resources :vendors
  end

  resources :vendors do
    resources :products do
      resources :sales, only: [:create, :new]
    end
    resources :sales, except: [:create, :new] do
      get 'current_month', on: :collection
    end
  end

end

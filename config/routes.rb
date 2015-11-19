Rails.application.routes.draw do

  root 'welcome#index'

  get 'welcome/market' => 'welcome#show'


  get 'vendors/:vendor_id/sales/current_month' => 'sales#current_month'

  resources :markets do
    resources :vendors
  end

  resources :vendors do
    resources :products
    resources :sales
  end

end

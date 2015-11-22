Rails.application.routes.draw do

  root 'markets#home'

  get '/vendors' => 'vendors#all'

  resources :markets do
  	resources :vendors do
  	end
  end

  resources :vendors do
  	resources :products, only: [:new, :create, :update, :edit]
  end

  resources :products, except: [:new, :create, :update, :edit] do
    resources :sales do
    end
  end
end


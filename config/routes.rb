Rails.application.routes.draw do

  root 'markets#home'

  get '/vendors' => 'vendors#all'

  resources :markets do
  	resources :vendors do
  		resources :products do
  			resources :sales do

  			end
  		end
  	end
  end

end

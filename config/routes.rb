Rails.application.routes.draw do

  root 'markets#home'

  resources :markets do
  	resources :vendors do
  		resources :products do
  			resources :sales do
  				
  			end
  		end
  	end
  end


  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end


end

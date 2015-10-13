Jpt::Application.routes.draw do
	root to: 'users#login'

  resources :events, only: [:index, :new, :create, :edit, :update] do
		collection do
			post :custom
			post :ajax
		end
	end
	
  resources :kouteimasters do
    collection do
      post :ajax
    end
  end
  
  resources :bashomasters do
    collection do
      post :ajax
    end
  end
  
  resources :jobmasters do
    collection do
      post :ajax
    end
  end

	match 'main', to: 'main#index', via: [:get]

  resources :users do
    collection do
      get :login
    end
  end
  
  resources :employers, :yakushokumasters, :shainmasters,  :shozokumasters, :joutaimasters,
	 :shozais, :jpt_holiday_msts, :kaishamasters


  resources :kintais, only: [:index] do

  end
  
  resources :keihis, only: [:index] do

  end
end

	# Example of regular route:

	# post 'users/login'

	# match 'login', to: 'users#create', via: [:post]
	# match 'change_pass', to: 'users#change_pass', via: [:get,:post]
	# match 'change_pass_exc', to: 'users#change_pass_exc', via: [:get,:post]
	# match 'multiselect', to: 'tree#multiselect', via: [:get,:post]
	# match 'employer', to: 'tree#employer', via: [:get,:post]

	# resources :employers, only: [:index, :create, :new, :edit, :show, :update, :destroy]

  
	#   get 'products/:id' => 'catalog#view'

	# Example of named route that can be invoked with purchase_url(id: product.id)
	#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

	# Example resource route (maps HTTP verbs to controller actions automatically):
	#   resources :products

	# Example resource route with options:
	#   resources :products do
	#     member do
	#       get 'short'
	#       post 'toggle'
	#     end
	#
	#     collection do
	#       get 'sold'
	#     end
	#   end

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

	# Example resource route with concerns:
	#   concern :toggleable do
	#     post 'toggle'
	#   end
	#   resources :posts, concerns: :toggleable
	#   resources :photos, concerns: :toggleable

	# Example resource route within a namespace:
	#   namespace :admin do
	#     # Directs /admin/products/* to Admin::ProductsController
	#     # (app/controllers/admin/products_controller.rb)
	#     resources :products
	#   end

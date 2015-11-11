Jpt::Application.routes.draw do
	root to: 'users#login'

  resources :events, only: [:index, :new, :create, :edit, :update] do
		collection {post :ajax, :custom}
	end
	
  resources :kouteimasters do
    collection {post :ajax}
  end
  
  resources :bashomasters do
    collection {post :ajax, :import}
  end
  
  resources :jobmasters do
    collection {post :ajax, :import}
  end

	match 'main', to: 'main#index', via: [:get]

  resources :users do
    collection {get :login}
  end
  
  resources :employers, :yakushokumasters, :shainmasters, :jpt_holiday_msts, :keihiheads

  resources :keihiheads do
    collection {post :ajax}
  end
  
  resources :jobmasters do
    collection {post :import}
  end
  
  resources :shozokumasters do
    collection {post :import}
  end
  
  resources :joutaimasters do
    collection {post :import}
  end
  
  resources :kaishamasters do
    collection { post :import}
  end
  
  resources :shozais do
    collection { post :import}
  end
  
  resources :kintais, only: [:index]
end
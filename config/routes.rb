Jpt::Application.routes.draw do
	root to: 'users#login'

  resources :events, only: [:index, :new, :create, :edit, :update] do
		collection {post :ajax, :custom}
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
  
  resources :yakushokumasters, param: :id do 
  end
  
  resources :jpt_holiday_msts do
  end

  resources :shainmasters do
  end
  
  resources :keihiheads do
    collection {post :ajax}
  end
  
  resources :shozokumasters do
    collection {post :import}
  end
  
  resources :joutaimasters do
    collection {post :import}
  end
  
  resources :kaishamasters, param: :id do
    collection { post :import}
  end
  
  resources :shozais do
    collection { post :import}
  end
  
  resources :kintais, only: [:index]

  constraints(:id => /\w+(,\w+)*/) do
    resources :kouteimasters do
      collection {post :ajax}
    end
  end
  # map.connect ':controller/:action/:id', :id => /\w+(,\w+)*/
end
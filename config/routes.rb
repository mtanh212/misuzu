Jpt::Application.routes.draw do
  resources :tsushinseigyous
  resources :dengonyoukens
  resources :dengonkaitous
  resources :dengons
  root to: 'users#login'

  resources :bashokubunmsts

  resources :bunruis

  resources :shoninshamsts

  resources :ekis do
    collection {post :import}
  end

  resources :kikanmsts do
    collection {post :import}
  end

  resources :kintais do
    collection {get :search}
  end
  
  resources :events, only: [:index, :new, :create, :edit, :update] do
		collection {post :ajax, :custom, :create_basho, :create_kaisha}
	end
	
  resources :bashomasters do
    collection {post :ajax, :import}
  end
  
  resources :jobmasters do
    collection {post :ajax, :import}
  end

	match 'main', to: 'main#index', via: [:get]

  resources :users do
    collection {get :login, :change_pass}
    collection {post :change_pass}
  end
  
  resources :yakushokumasters, param: :id do 
  end
  
  resources :jpt_holiday_msts do
  end

  resources :shainmasters do
  end
  
  resources :keihiheads do
    collection {post :ajax, :shonin_search}
    collection {get :shonin_search}
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
  
  constraints(:id => /\w+(,\w+)*/) do
    resources :kouteimasters do
      collection {post :ajax}
    end
  end
  # map.connect ':controller/:action/:id', :id => /\w+(,\w+)*/
end
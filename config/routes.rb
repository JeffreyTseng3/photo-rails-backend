Rails.application.routes.draw do
    defaults format: :json do
        resources :photos, only: [:index, :show] 
        resources :users, only: [:create, :index]
        resource :session, only: [:create, :destroy]

        resources :collection_items, only: [:index, :create, :destroy] do 
            collection do 
                delete 'remove_item'
            end     
        end

        resources :comments, only: [:index, :create, :destroy] do 
            collection do 
                delete 'remove_comment'
            end     
        end
    end
     root "static_pages#root"
end

Rails.application.routes.draw do

  devise_for :designers 
  devise_for :users
  resources :users, :only => [:show, :edit, :update] 

  resources :designers, :only => [:show, :edit, :update] 
 

resources :albums do
  resources :photos, only: [:new, :create, :index, :show]
end

resources :photos, only: [:edit, :update, :destroy]

resources :contacts, only: [:new, :create, :index]

resources :designers do
  member do
    get 'profile'
    get 'gallery'
  end
end

  root             'static_pages#home'
  get 'users_type'    => 'static_pages#users_type'
  get 'contact'       => 'static_pages#contact'
  get 'designs'       => 'static_pages#designs'
  get 'products'      => 'static_pages#products'
  get 'banana'        => 'static_pages#index'
  get '/designer_profile/:id' => 'designers#profile'

  


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
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
end

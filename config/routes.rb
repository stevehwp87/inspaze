Rails.application.routes.draw do

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :designers, controllers: { registrations: "registrations" }
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, :only => [:show, :edit, :update]do
    member do
      get 'ideabook'
    end
  end 

  resources :designers, :only => [:show, :edit, :update] do
    member do
      get 'profile'
      get 'gallery'
    end
  end
 

resources :albums do
  resources :photos, only: [:new, :create, :index, :show]
end


get '/like/:id' => "static_pages#like"
get '/unlike/:id' => "static_pages#unlike"
resources :photos, only: [:edit, :update, :destroy]

resources :contacts, only: [:new, :create]
resource :inbox, :controller => 'inbox', :only => [:show,:create]
# resources :designers do
#   member do
#     get 'profile'
#     get 'gallery'
#   end
# end

  root             'static_pages#home'
  get 'users_type'    => 'static_pages#users_type'
  get 'contact'       => 'static_pages#contact'
  get 'designs'       => 'static_pages#designs'
  get 'products'      => 'static_pages#products'
  get 'index'         => 'static_pages#index'
  get 'banana'         => 'static_pages#banana'

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

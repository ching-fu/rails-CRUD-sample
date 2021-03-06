Rails.application.routes.draw do
  #tell devise, after FB reply, return to omniauth_callbacks
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "/ajaxhome" => "ajaxhost#index"
  get "/ajaxitem" => "ajaxhost#ajaxitem"

#    match ':controller(/:action(/:id(.:format)))', :via => :all
# for RESTful
  resources :events do#default controller name will be attendees
    resources :attendees, :controller => "event_attendees"
    resource :location, :controller => "event_locations"
    resources :likes
    collection do
      get :latest
      post :bulk_delete
      post :bulk_update
    end
    member do
      get :dashboard
      post :join
      post :withdraw
    end
  end

  namespace :admin do
    #default :controller => "admin::events"
    resources :events
  end

  root :to => 'events#index'

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

YouBusServer::Application.routes.draw do
  
 # match ':controller/:action'

 match 'stops/get_nearest/:long/:lat/:radius/:offset/:limit'=> 'stops#get_nearest', :constraints => {:long => /[-+]?[0-9]*\.?[0-9]+/, :lat => /[-+]?[0-9]*\.?[0-9]+/, :radius=>/[-+]?[0-9]*\.?[0-9]+/ }
 
 match 'routes/get_routes_by_stop_id/:bus_stop_id' =>'routes#get_routes_by_stop_id'
 
 match 'routes/get_routes_by_stop_id_no_constraint/:bus_stop_id' =>'routes#get_routes_by_stop_id_no_constraint'
 
 match 'routes/get_bus_route_by_id_at_stop_id/:bus_route_id/at/:bus_stop_id' =>'routes#get_bus_route_by_id_at_stop_id'
 
 match 'routes/insert_routes_at_stop' => 'routes#insert_routes_at_stop'
 
 resources :trips

 resources :checkins

 resources :schedules

 resources :stops

 resources :routes

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  root :to  => 'routes#index'

  
end

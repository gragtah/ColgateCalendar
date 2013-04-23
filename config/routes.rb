ColgateCalendar::Application.routes.draw do

  match '/' => 'home#home'
  
  match '/user/login' => 'users#login'
  match '/user/logout' => 'users#logout'
  match '/user/authenticate' => 'users#authenticate'
  match '/user/:id/settings' => 'users#settings'
  match '/user/:id/update_tags' => 'users#update_tags'
  
#resources :eventlists
#root :to => redirect('/home')
  match '/show_event_list' => 'eventlists#show_event_list'
  match '/events/today' => 'events#events_today', :as => 'events_today'
  match '/events/tomorrow' => 'events#events_tomorrow', :as => 'events_tomorrow'
  match '/events/week' => 'events#events_this_week', :as => 'events_this_week'
  match '/events/past' => 'events#events_past', :as => 'events_past'
  match '/events/upvote' => 'events#upvote_on_event', :as => 'event_upvote' 
  match '/events/:id/downvote' => 'events#downvote_on_event', :as => 'event_downvote' 

  
#TODO: Do we need the :as for the above 3?
  resources :events
  match '/fetch_and_save_events' => 'events#fetch_and_save_events'

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

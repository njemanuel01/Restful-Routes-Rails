Rails.application.routes.draw do
  
  # User routes
  get "/users" => 'users#list'
  get "/users/new" => 'users#new_form'
  post "/users" => 'users#new_form_do'
  get "/users/:id/delete" => 'users#delete_form'
  delete "/users/:id" => 'users#delete_form_do'
  get "/users/:id/edit" => 'users#edit_form'
  put "/users/:id" => 'users#edit_form_do'
  get "users/:id" => 'users#single'
  
  # Story routes
  get "/users/:user_id/stories" => 'stories#list'
  get "/users/:user_id/stories/new" => 'stories#new_form'
  post "/users/:user_id/stories" => 'stories#new_form_do'
  get "/users/:user_id/stories/:story_id/delete" => 'stories#delete_form'
  delete "/users/:user_id/stories/:story_id" => 'stories#delete_form_do'
  get "/users/:user_id/stories/:story_id/edit" => 'stories#edit_form'
  put "/users/:user_id/stories/:story_id" => 'stories#edit_form_do'
  get "users/:user_id/stories/:story_id" => 'stories#single'
  
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

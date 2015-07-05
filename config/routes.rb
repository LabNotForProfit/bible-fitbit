Rails.application.routes.draw do
  get 'timeline/index'
  get 'timeline/edit'
  get 'timeline/edit/:book' => 'timeline#update'

  #devise_for :users
  get 'home/index'
  # get 'api/users/show' => 'api/registrations#show'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'home#index'

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

   #   namespace :admin do
  #     # Directs /api/users/* to Api::UsersController
  #     # (app/controllers/api/users_controller.rb)
  #     resources :users
  #   end
  devise_for :users
  namespace :api do
    resources :badges, controller: 'badges'
    resources :books, controller: 'books'
    resources :leaderboards, controller: 'leaderboards'
    resources :fill_in_blanks, controller: 'fill_in_blanks'
    devise_for :users
    devise_scope :user do 
      resources :users, only: [:index, :show, :edit, :update], controller: 'users'
      resources :friendships
      resources :friend_requests, :except => [:new, :show, :edit]
    end 
  end

end

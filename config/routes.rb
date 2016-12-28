Rails.application.routes.draw do
  devise_for :recruiters, :controllers => { registrations: 'recruiters/registrations', sessions: 'recruiters/sessions'}
  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions'}
  resources :homepages, only: [:index]
  resources :jobs, only: [:index, :create, :new, :show, :update, :edit]
  resources :users, only: [:show, :create, :new, :update, :edit]
  resources :recruiters, only: [:create, :show, :edit, :update]
  resources :tags, only: [:index,:create, :new]
  resources :searchs, only: [:index]
  resources :candidacies, only: [:create]
  resources :messages, only: [:create, :new, :index]
  get 'tags/', to: 'jobs#index', as: "search_tag"
  get 'searchs/search' => 'searchs#search'

  root 'homepages#index'
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

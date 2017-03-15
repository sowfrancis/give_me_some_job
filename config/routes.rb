Rails.application.routes.draw do
  devise_for :recruiters, :controllers => { registrations: 'recruiters/registrations', sessions: 'recruiters/sessions'}
  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions'}
  resources :homepages, only: [:index]
  resources :jobs
  resources :users, only: [:show, :create, :new, :update, :edit]
  resources :recruiters, only: [:create, :show, :edit, :update]
  resources :tags, only: [:index,:create, :new]
  resources :searchs, only: [:index]
  resources :candidacies, only: [:create, :index, :create_multiple] do
    collection do
      post '/create_multiple' => 'candidacies#create_multiple'
    end
  end
  resources :messages, only: [:create]
  get 'tags/', to: 'jobs#index', as: "search_tag"
  get 'searchs/search' => 'searchs#search'
  post 'jobs/:id/' => 'jobs#destroy', method: :delete, as: 'delete_job'

  root 'jobs#index'
end
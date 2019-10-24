Rails.application.routes.draw do
  get 'resumes/index'
  get 'resumes/new'
  get 'resumes/create'
  get 'resumes/destroy'
  resources :users
  # root 'users#index'
  post '/users/create_user', :to => 'users#create_user'
  resources :resumes, only: [:index, :new, :create, :destroy, :show]   
   root "resumes#index"  
   get 'resumes/create_check', :to => 'resumes#create_check'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

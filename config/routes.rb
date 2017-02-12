Rails.application.routes.draw do
  root 'questions#home'	

  resources :questions do
    
    member do
      get :delete
      get :home
      get :quiz_mode
      get :result
    end

  end
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { registrations: 'registrations' }
  #devise_for :users
  get 'home/index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'home/index'

 # get 'home/index'
  
=begin
  get 'homeworks/new'

  get 'homeworks/edit'

  get 'homeworks/show'
=end
=begin
  get 'subjects/new'

  get 'subjects/show'

  get 'subjects/index'
=end
  root 'home#index'
  get  'users/record'
  get  'users/cancel'
  get  'users/submit'
  
=begin
  get 'users/index'

  get 'users/show'
=end

devise_for :users, controllers: {   registrations: 'users/registrations',
                                    sessions: 'users/sessions' }

  #devise_for :users

  resources :users do 
    resource :studies
  end
  resources :subjects 
  resources :homeworks do 
    resource :checks 
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

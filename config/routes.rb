Rails.application.routes.draw do
  get 'issues/new'

  get 'users/new'

  get 'sessions/new'

  get 'static_pages/home'

  get 'static_pages/help'

  resources:schema #mangoDB
  resources:issues
  resources:users
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#help'
end

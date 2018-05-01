Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  resources:schema #mangoDB
  resources:issues
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#help'
end

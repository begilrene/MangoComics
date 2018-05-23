Rails.application.routes.draw do
  resources:schema
  resources:issues do
    resources:i_comments
    collection do
      get:search
    end
  end
  resources:users
  resources:news do
      resources:m_comments
  end

  get 'new/new'

  get 'issues/new'

  get 'users/new'

  get 'sessions/new'
  
  get 'issues/search'

  get 'static_pages/comiclist'
  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/issues'
  get 'static_pages/news1'
  get 'static_pages/news2'
  get 'static_pages/news3'

  get    '/index',   to: 'issues#search'
  get    '/search',  to: 'issues#search'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  get    '/logout',  to: 'sessions#destroy'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end

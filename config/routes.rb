Rails.application.routes.draw do
  resources:schema
  resources:volumes do
    resources:v_ratings
    resources:vreviews
    resources:v_comments
  end
  resources:series do
    resources:s_ratings
    resources:sreviews
    resources:s_comments
  end
  resources:publisher
  resources:franchise
  resources:reviews
  resources:issues do
    resources:i_ratings
    resources:i_comments
    resources:reviews
    collection do
      get:search
    end
  end
  resources:users do
    resources:u_comments
    resources:flists
  end
  
  resources:news do
      resources:m_comments
  end
  
  
  get 'users/:id/icomments' => 'users#icomments', :as => :user_icomments

  get 'sessions/new'
  get 'franchise/show'
  get 'static_pages/comiclist'
  get 'static_pages/home'


  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  get    '/logout',  to: 'sessions#destroy'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end

Rails.application.routes.draw do
  as :user do
    get '/user/sign_in' => 'devise/sessions#new', :as => :new_user_session
    post '/user/sign_in' => 'devise/sessions#create', :as => :user_session
    match '/user/sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session, via: [:delete, :get]
  end
  resources :users, except: :destroy
  devise_for :users, :skip => [:sessions]

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :teams

  resources :word_hunts do
    post :valid_words, on: :member
  end
end

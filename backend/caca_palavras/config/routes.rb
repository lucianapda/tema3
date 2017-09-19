Rails.application.routes.draw do
  resources :usuarios, except: :destroy
  resources :turmas

  resources :caca_palavras do
    post :valida_palavras, on: :member
  end
end

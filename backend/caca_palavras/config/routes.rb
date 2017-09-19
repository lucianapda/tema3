Rails.application.routes.draw do
  resources :usuarios, only: [:index, :show]
  resources :turmas, except: :destroy

  resources :caca_palavras do
  	post :valida_palavras, on: :member
  end
end

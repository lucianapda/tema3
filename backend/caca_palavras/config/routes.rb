Rails.application.routes.draw do
  resources :usuarios, only: [:index, :show]
  resources :turmas, except: :destroy
  resources :caca_palavras
end

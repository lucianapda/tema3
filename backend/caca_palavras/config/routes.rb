Rails.application.routes.draw do
  resources :usuarios, except: :destroy
  resources :turmas, except: :destroy

  resources :caca_palavras do
    post :valida_palavras, on: :member
  end
end

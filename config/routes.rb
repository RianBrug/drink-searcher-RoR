Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'drinks#index'
  post "/", to: 'drinks#index'
  post "search", to: 'drinks#search'
  post "distilled", to: 'drinks#search'
  post "extra_cold", to: 'drinks#search'
  resources :home, only: %i[index]
end

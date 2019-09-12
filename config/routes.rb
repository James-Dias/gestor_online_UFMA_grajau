Rails.application.routes.draw do
  resources :problems
  resources :sectors
  root to: 'sectors#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

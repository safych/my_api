Rails.application.routes.draw do
  resources :ratings
  resources :disks
  resources :songs
  resources :groups
  resources :singers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

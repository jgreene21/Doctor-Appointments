Rails.application.routes.draw do
  get 'static_pages/home'
  root 'static_pages#home'

 resources :doctors
 resources :patients do 
  resources :appointments, only: [:index, :new, :create, :destroy]
 end 
end

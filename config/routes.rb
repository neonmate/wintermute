Rails.application.routes.draw do
  resources :errors, only: :new
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

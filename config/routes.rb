Rails.application.routes.draw do
  root 'projects#index'

  get 'session/new', as: :sign_in
  delete 'session', action: :destroy, controller: 'session', as: :sign_out
  get '/auth/github/callback', action: :create, controller: 'session'

  get 'privacy', action: :privacy, controller: 'page'

  resources :projects
end

Rails.application.routes.draw do
  root 'page#about'

  get 'session/new', as: :sign_in
  delete 'session', action: :destroy, controller: 'session', as: :sign_out
  get '/auth/github/callback', action: :create, controller: 'session'

  get 'privacy', action: :privacy, controller: 'page'
  get 'markdown_help', action: :markdown_help, controller: 'page'
  get 'about', action: :about, controller: 'page'
  resources :ideas
  resources :messages, only: [:new, :create, :edit, :update, :destroy]
  resources :repositories

  namespace :user do
    resources :subscriptions, only: [:create, :destroy]
  end

  resources :errors, only: :new

  if Rails.env.test? || Rails.env.development?
    get :test_flash, controller: 'tests'
    get :colors, controller: 'tests'
  end
end

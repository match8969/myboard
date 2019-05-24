Rails.application.routes.draw do
  
  namespace :admin do
    get 'home/index'
    resources :instagram_accounts
    resources :instagram_contents
  end

  # Root
  root :to => "admin/home#index"

  # ユーザー
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    confirmations: "users/confirmations"}

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  # メール確認
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
end

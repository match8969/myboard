Rails.application.routes.draw do
  
  # Root
  root :to => "admin/instagram_accounts#index"

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

  namespace :admin do
    resources :instagram_accounts
  end

  # メール確認
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
end

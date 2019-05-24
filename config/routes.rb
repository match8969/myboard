Rails.application.routes.draw do
  
  namespace :admin do
    get 'home/index'
    resources :instagram_accounts
  end
  get 'instagram_contents/create'
  get 'instagram_contents/destroy'
  
  resources :instagram_contents

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

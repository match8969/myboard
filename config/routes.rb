Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    confirmations: "users/confirmations"}

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end

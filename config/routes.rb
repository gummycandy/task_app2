Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "sign_up", :to => "users/registrations#new"
    post "sign_up", :to => "users/registrations#create"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
    get "user/:id/edit", :to => "users/registrations#edit"
    get "user/:id", :to => "users/registrations#show"
  end

  root :to => "home#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

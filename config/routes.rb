Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "signup", :to => "users/registrations#new"
    post "signup", :to => "users/resistrations#create"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
    get "user/:id", :to => "users/registrations#show"
  end

  root :to => "home#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

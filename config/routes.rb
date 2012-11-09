Bigas::Application.routes.draw do
  devise_for :users

  root to: "home#index"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
end

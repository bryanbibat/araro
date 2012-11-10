Bigas::Application.routes.draw do
  resource :game, path: "g", only: :show do
    collection do
      post :next_day
    end
  end

  devise_for :users

  root to: "home#index"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
end

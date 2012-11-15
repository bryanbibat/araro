Bigas::Application.routes.draw do
  resources :varieties, only: [:index, :show] do
    member do
      post :plant
    end
  end

  get "varieties/show"

  resource :game, path: "g", only: :show do
    collection do
      post :reset
      post :next_week
      post :tractor
      post :carabao
      post :typhoon
      post :flood
      post :drought
      post :raticide
      post :herbicide
      post :hand_weed
      post :do_nothing
      post :machine_mill
      post :hand_mill
    end
  end

  devise_for :users

  root to: "home#index"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
end

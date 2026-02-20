Rails.application.routes.draw do
namespace :admin do
  get "dashboard", to: "dashboard#index"
  resources :anime_entries, only: [:index] do
    patch :set_featured, on: :member
  end
end
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  # pozostałe trasy (anime, manga, subscribers, devise, etc.)
  get "manga/index"
  get "anime/index"
  get "newsletter/subscribe"
  get "newsletter/destroy"
  devise_for :users
  get "home/index"
  root "home#index"
  resources :subscribers, only: [:create]
  delete "/unsubscribe", to: "subscribers#destroy", as: :unsubscribe
  get "anime", to: "anime#index", as: :anime
  get "manga", to: "manga#index", as: :manga
  get "about", to: "pages#about"
  get "up" => "rails/health#show", as: :rails_health_check
end
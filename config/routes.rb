Rails.application.routes.draw do
  root 'homes#top'

  get "home/about" => "homes#about"

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, only:[:new, :create, :index, :show, :destroy, :edit, :update] do
  end

  resources :users, only: [:new, :create, :show, :edit, :update, :index,]
end

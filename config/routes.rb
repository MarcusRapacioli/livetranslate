Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :documents do
    resources :sections
  end
  resources :lessons
  resources :student_lessons
  resources :users
    resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end
end

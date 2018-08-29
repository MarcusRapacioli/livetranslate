Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :documents do
    resources :sections
  end
  resources :lessons
  resources :student_lessons
  resources :users

end

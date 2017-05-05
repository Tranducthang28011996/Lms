Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope "(:locale)", locale: /en|de/ do
    root "courses#index"
    post 'courses/:id/enroll', to: "courses#enroll"
    # get "courses/:id", to: "courses#show"

    post 'sessions/create'
    get 'login', to: "sessions#new"
    # get 'users/new'
    resources :users

    delete 'sessions/logout', to: "sessions#destroy"

    post "courses/search", to: "courses#search"
    get "courses/auto_complete", to: "courses#auto_complete"

    get "dashboard", to: "courses#dashboard"
    get "/courses/:id", to: "courses#show", as: :my_course
    get "courses/:course_id/lessons/:id", to: "lessons#show", as: :lesson
    get "courses/:id/detail", to: "courses#detail"

  end

  namespace :admin do
    root to: "courses#index"
    get 'courses', to: "courses#index"

    patch "courses/approve", to: "courses#approve", as: :approve_course

    resources :courses
    resources :lessons
  end
end

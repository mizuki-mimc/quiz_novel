Rails.application.routes.draw do
  get "quizzes/start"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get 'quiz/start', to: 'quizzes#start'
  post 'quiz/begin', to: 'quizzes#begin_quiz'
  get 'quiz/question', to: 'quizzes#question'
  post 'quiz/answer', to: 'quizzes#answer'
  get 'quiz/explanation', to: 'quizzes#explanation'
  post 'quiz/next', to: 'quizzes#next_question'
  get 'quiz/results', to: 'quizzes#results'
  # root "posts#index"
end

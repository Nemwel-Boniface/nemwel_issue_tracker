Rails.application.routes.draw do
  get 'reports/project_issues_export', to: 'reports#project_issues_export', as: 'project_issues_export'
  get '/reports', to: 'reports#index', as: 'reports'
  resources :projects do
    resources :issues, only: [:create, :edit, :update]
  end

  resources :issues, only: [:edit, :update, :destroy] do
    member do
      patch :update_status
    end
  end

  devise_for :users
  get 'home/index'
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

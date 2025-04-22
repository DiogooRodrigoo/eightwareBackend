Rails.application.routes.draw do
  # Devise routes for user authentication
  # Custom paths for session and registration controllers
  devise_for :users, path: 'auth', controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations' 
  }

  # Devise scope to define routes specifically for user authentication
  devise_scope :user do
    get 'auth/me', to: 'users/sessions#me'
  end

  # Health check route for monitoring the status of the Rails application
  # Commonly used in production environments for uptime monitoring
  get "up" => "rails/health#show", as: :rails_health_check

end

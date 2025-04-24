Rails.application.routes.draw do
  # Definindo as rotas do Devise para autenticação de usuários com caminhos customizados
  devise_for :users, path: 'auth', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Definindo o escopo para a rota customizada de registro
  devise_scope :user do
    post 'auth/sign_up', to: 'users/registrations#create', as: :user_sign_up
    get 'auth/me', to: 'users/sessions#me'
  end

  # Rota de verificação de saúde do Rails
  get "up" => "rails/health#show", as: :rails_health_check
end
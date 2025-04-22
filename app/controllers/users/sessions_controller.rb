class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user_from_token!, only: [:me]

  # Override the create action
  def create
    user = User.find_by(email: params[:email])

    if user && user.valid_password?(params[:password])
      token = generate_jwt(user)

      render json: {
        message: "Login realizado com sucesso", 
        user: {
          id: user.id, 
          full_name: user.full_name,
          email: user.email
        }, 
        token: token
      }, status: :ok
    else
      render json: { message: "Erro ao realizar login" }, status: :unauthorized
    end
  end

  # Action to return authenticated user's data
  def me
    if @current_user
      render json: {
        id: @current_user.id,
        full_name: @current_user.full_name,
        email: @current_user.email,
        created_at: @current_user.created_at,
        updated_at: @current_user.updated_at
      }, status: :ok
    else
      render json: { message: "Usuário não encontrado ou token inválido" }, status: :unauthorized
    end
  end

  private

  # Method to authenticate the user from the JWT token
  def authenticate_user_from_token!
    token = request.headers['Authorization']&.split(' ')&.last

    if token
      begin
        decoded_token = JWT.decode(token, Rails.application.credentials.dig(:devise, :jwt_secret_key)).first
        user_id = decoded_token['sub']

        @current_user = User.find_by(id: user_id)
        render json: { message: 'Usuário não encontrado' }, status: :unauthorized if @current_user.nil?
        
      rescue JWT::DecodeError
        render json: { message: 'Token inválido' }, status: :unauthorized
      rescue ActiveRecord::RecordNotFound
        render json: { message: 'Usuário não encontrado' }, status: :unauthorized
      end
    else
      render json: { message: 'Token não fornecido' }, status: :unauthorized
    end
  end

  # Method to generate the JWT token
  def generate_jwt(user)
    payload = { sub: user.id, exp: 24.hours.from_now.to_i }
    JWT.encode(payload, Rails.application.credentials.dig(:devise, :jwt_secret_key))
  end
end
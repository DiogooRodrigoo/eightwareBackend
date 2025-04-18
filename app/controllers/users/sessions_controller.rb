class Users::SessionsController < Devise::SessionsController
   
    private
    # When the login is successful
    def respond_with(resource, _opts = {})
    if resource.persisted?
        token = generate_jwt(resource)

        logger.debug("Usuário autenticado: #{resource.email}")
        logger.debug("Token gerado: #{token}")

    render json: {
        message:"Login realizado com sucesso", 
        user: {
            id: resource.id, 
            full_name: resource.full_name,
            email: resource.email}, 
        token: token }, 
        status: :ok
    else
        render json: { message: "Erro ao realizar login" }, status: :unauthorized
    end
    end

    # Method to generate the JWT token
    def generate_jwt(user)
        payload = {sub: user.id, exp: 24.hours.from_now.to_i}

        JWT.encode(payload, Rails.application.credentials.dig(:devise, :jwt_secret_key))
    end

end

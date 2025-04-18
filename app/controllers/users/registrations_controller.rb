class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json

    private

    def respond_with(resource, _opts = {})
        register_sucess && return if resource.persisted?

        register_failed
    end

    def register_sucess
        render json: { message: "Cadastro realizado com sucesso", user: resource }, status: :created
    end
    
    def register_failed
        render json: { message: "Erro ao realizar cadastro", errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
end

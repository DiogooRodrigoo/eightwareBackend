class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json

    private

    # Method that defines how the API should respond after the registration attempt.
    def respond_with(resource, _opts = {})
        @user = resource
        register_sucess && return if resource.persisted?

        register_failed
    end

    #Returns a success response with the registered user’s data.
    def register_sucess
        render json: { 
            message: "Cadastro realizado com sucesso", 
            user: {
                id: @user.id,
                full_name: @user.full_name,
                email: @user.email
            }
            }, 
        status: :created
    end
    
    #Returns an error response with the validation messages from Devise/ActiveRecord.
    def register_failed
        render json: { message: "Erro ao realizar cadastro", errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
end

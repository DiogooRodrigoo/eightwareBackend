class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json
  
    private
  
    # Method that defines how the API should respond after the registration attempt.
    def respond_with(resource, _opts = {})
      if resource.persisted?
        register_success
      else
        register_failed
      end
    end
  
    # Returns a success response with the registered user’s data.
    def register_success
      render json: { 
        message: "Cadastro realizado com sucesso", 
        user: user_data(@user)
      }, status: :created
    end
  
    # Returns an error response with the validation messages from Devise/ActiveRecord.
    def register_failed
      render json: { message: "Erro ao realizar cadastro", errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  
    # Helper method to format user data
    def user_data(user)
      {
        id: user.id,
        full_name: user.full_name,
        email: user.email
      }
    end
  end
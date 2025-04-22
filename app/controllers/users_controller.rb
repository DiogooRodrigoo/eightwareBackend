class UsersController < ApplicationController
    # Ensures that the user is authenticated before accessing any action
    before_action :authenticate_user!

    # Action to return the authenticated user's information
    def me 
        render json: {user: current_user}, status: :ok
    end
end

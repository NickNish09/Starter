module V1
  class SessionsController < ApiController

    def token_login
      @user = User.find_by(token: params[:token])
      if @user.persisted?
        render json: @user
      else
        render json: { error: "Falha ao autenticar" }.to_json,
               status: :unauthorized
      end
    end

    # POST /v1/login
    def create
      @user = User.find_for_database_authentication(email: params[:email])
      return invalid_login_attempt unless @user

      if @user.valid_password?(params[:password])
        render json: @user, root: nil
      else
        invalid_login_attempt
      end
    end

    private

    def invalid_login_attempt
      warden.custom_failure!
      render json: { error: t('sessions_controller.invalid_login_attempt') },
             status: :unprocessable_entity
    end
  end
end

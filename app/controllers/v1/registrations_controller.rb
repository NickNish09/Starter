module V1
  class RegistrationsController < ApiController
    def create
      @user = User.new(user_params)
      respond_to do |format|
        format.json do
          if @user.save
            render json: @user, root: nil
          else
            render json: { error: "Parâmetros inválidos" }.as_json,
                   status: :unprocessable_entity
          end
        end
      end
    end

    private

    def user_params
      params.require(:user).permit(
        :email,
        :first_name,
        :last_name,
        :password,
        :name
      )
    end
  end
end
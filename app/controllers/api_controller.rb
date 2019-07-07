class ApiController < ActionController::Base
  protect_from_forgery with: :null_session
  include AbstractController::Translation
  respond_to :json

  def current_user
    @current_user ||= authenticate_token
  end

  private

  def authenticate_token
    auth_token = request.headers['Authorization']
    @user = User.find_by(token: auth_token)
    @user
  end

  ##
  # Authentication Failure
  # Renders a 401 error
  def authentication_error
    # User's token is either invalid or not in the right format
    render json: {error: t('unauthorized')}, status: 401 # Authentication timeout
  end
end

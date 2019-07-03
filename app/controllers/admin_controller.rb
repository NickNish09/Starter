class AdminController < ApplicationController
  layout 'admin'
  before_action :require_admin!
  def index
  end

  def require_admin!
    unless user_signed_in? and current_user.is_admin?
      flash[:danger] = "Apenas administradores tem acesso à essa área."
      redirect_to root_path
    end
  end
end

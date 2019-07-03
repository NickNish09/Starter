class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_admin?
      admin_index_path
    else
      root_path
    end
  end

  def after_update_path_for(resource_or_scope)
    if resource_or_scope.is_admin?
      admin_index_path
    else
      root_path
    end
  end
end

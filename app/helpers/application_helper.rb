module ApplicationHelper
  def require_admin
    deny_access unless logged_in_as_admin?
  end

  def logged_in_as_admin?
    current_user && current_user.admin?
  end

  def deny_access
    flash[:error] = "您没有足够的权限。"
    redirect_to root_url
  end
end

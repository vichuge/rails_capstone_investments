module SessionsHelper
  def current_user
    session[:user_id]
  end

  def logged_user?
    !current_user.nil?
  end

  def redirect_to_login
    controller.redirect_to root_path unless logged_user?
  end
end

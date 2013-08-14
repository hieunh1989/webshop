class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def after_sign_in_path_for(user)
    if user.admin?
      return admin_users_path
    else
      return root_path
    end
  end

  def facebook_cookies
    @facebook_cookies ||= Koala::Facebook::OAuth.new(YOUR_APP_ID, YOUR_SECRET).get_user_info_from_cookie(cookies)
  end
end
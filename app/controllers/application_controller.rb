class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :query_cart

  def after_sign_in_path_for(user)
    if user.admin?
      return admin_users_path
    else
      return root_path
    end
  end


  def query_cart
    if cookies["order"].nil?
      @count = 0
    else
      a = JSON.parse(cookies["order"])
      @count = a["items"].map{ |i| i["quantity"] }.sum
    end
  end
end
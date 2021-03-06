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
    @count = 0
    unless cookies["basket"].nil?
       a = JSON.parse(cookies["basket"])
       @count = a["items"].map{ |i| i["quantity"] }.sum
       @total = a["items"].map{ |b| b["quantity"]*b['product']["price"] }.sum
    end
  end
end
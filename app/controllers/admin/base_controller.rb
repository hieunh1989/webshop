class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!
  before_filter :auth_user
  layout "admin"

  private
  def auth_user
    redirect_to root_url unless current_user.admin?
  end
end
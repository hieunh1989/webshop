class OauthController < ApplicationController
  def redirect
    session[:access_token] = Koala::Facebook::OAuth.new(oauth_redirect_url).get_access_token(params[:code]) if params[:code]
    if user.fb_access_token?

    else
      @graph = Koala::Facebook::API.new(session[:access_token])
      @fb_auth = @graph.get_object("me")
      @user = User.new(first_name: @fb_auth['first_name'], 
                      last_name: @fb_auth['last_name'], 
                      email: @fb_auth['email'], 
                      password: "123456", 
                      fb_access_token: @graph.access_token)
      @user.save
      #binding.pry
      redirect_to session[:access_token] ? root_path : root_path
    end
    # if session[:access_token]
    #   root_path
    # else
    #   users_path
    # end
  end
end
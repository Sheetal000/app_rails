class LoginController < ApplicationController
  def create 
    debugger
    if user = User.authenticate(params[:username],params[:password])
      session[:current_user_id] = user.id
      redirect_to root_url
    end
  end
end

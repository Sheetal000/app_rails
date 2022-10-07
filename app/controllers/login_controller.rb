class LoginController < ApplicationController
  def create 
    # debugger
    if user = User.authenticate(params[:username],params[:password])
      session[:current_user_id] = user.id
      redirect_to root_url
    end
  end
  def show 
    @login = Login.find_by(id: params[:id])
  end

  private

  def login_params
    params.permit(:user_name,:password,)
  end
end

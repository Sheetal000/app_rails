class UsersController < ApplicationController
  def index
    @users = User.all

    # respond_to do |format|
    #   format.html
    #   format.xml {render xml: @users}
    #   format.json {render json: @users}
    # end
  end
  def show
    # debugger
    @user = User.find_by(id:params[:id] params[:user_id])
  end
  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/"
    end

  end
  private

  def user_params
    params.permit(:first_name,:last_name,:age)
  end
end

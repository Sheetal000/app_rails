class AdminsController < ApplicationController
  # def index
  #   @admin = Admin.all
  # end

  # def create
  #   @admin = Admin.new(admin_params)
  #   if @admin.save
  #     redirect_to "/"
  #   end
  # end
 
 # http_basic_authenticate_with name: "aneey", password: "5baa61e4"
 USERS = {"lifo" => "world"}
 before_action :authenticate
 def index
  @admin = Admin.all
 end
   private
  def authenticate
   authenticate_or_request_with_http_digest do |username|
    # USERS[username]
    "world"

   end
  end
end

class PostsController < ApplicationController
  TOKEN = "secret"
  before_action :authenticate

  def index
    @post = [] 
    render json: {msg: 'successfully...'}
  end

 private
 def authenticate
  Rails.logger.debug "+++++++++++++Authenticating++++++++++++++++="
  authenticate_or_request_with_http_token do |token,options|
    ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
    end
  end
end

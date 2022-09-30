class ApplicationController < ActionController::Base
  def default_url_options
    { locale: I18n.locale }
  end
  private 
  
  def current_user  
    @_current_user ||= session[:current_user_id] &&
    User.find_by(id: session[:current_user_id])
  end  
end

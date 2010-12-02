class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def check_admin
    if session.has_key?(:admin_id)
      true
    else
      redirect_to '/'
    end
  end
end

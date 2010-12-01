class AdminAuthController < ApplicationController
  def login
    if params[:name]
      matches = Admin.where(:name => params[:name], :password => (Digest::SHA2.new << params['password']).to_s)
      if matches.length > 0
        admin = matches[0]
        session[:admin_id] = admin.id
        flash[:notice] = "You have logged in as " + admin.name
      else
        flash[:notice] = "You failed to log in"
      end
    end
  end

  def logout
    session.delete(:admin_id)
  end

end

module ApplicationHelper
  def is_admin_user?
    #if $current_user_type=="admin"
    if session[:user_type] == "admin"
      true
    else
      false
    end
  end
  def current_user
    #@current_user ||= User.find_by(id: session[:user_id])  || Member.find_by(id: session[:user_id])
    @current_user = User.find_by(username: session[:username])
  end
  def logged_in?
    #if $current_user_type=="admin"
    if current_user != nil
      true
    else
      false
    end
  end
=begin
  def is_super_user?
    #if $current_user_type=="admin"
    if user.username == "admin"
      false
    else
      true
    end
  end
=end
end

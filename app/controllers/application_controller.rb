class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

# Returns the current logged-in user (if any).


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

=begin
  def is_admin_user?
    #if $current_user_type=="admin"
    if session[:user_type] == "admin"
      true
    else
      false
    end
  end
=end

  def is_admin_user?
    #current_user && current_user.is_lib_member && !session[:is_admin]
    if session[:user_type]== "admin"
      #if $current_user_type=="member"
      #redirect_to(:controller => 'access', :action => 'admin')
      return true
    else
      return false
    end
  end

  def is_member_user?
    #current_user && current_user.is_lib_member && !session[:is_admin]
    if session[:user_type]== "member"
    #if $current_user_type=="member"
      redirect_to(:controller => 'access', :action => 'member')
      return false
    else
      return true
    end
  end

  private
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in"
      #redirect_to(:action => 'login')
      redirect_to(:controller => 'access', :action => 'login')
      return false #halts the before_action
    else
      return true
    end
  end
end


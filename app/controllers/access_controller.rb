class AccessController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    # Just displays text and links
  end
  def member
  end

  def login
    #login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
        #authorized_user_type = found_user.user_type
      end
#      found_member = Member.where(:username => params[:username]).first
 #     if found_member
  #      authorized_member = found_member.authenticate(params[:password])
   #   end
    end
=begin
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first or found_user = Member.where(:username => params[:username]).first

          if found_user && found_user.params[:user_type]='admin'
        authorized_user = found_user.authenticate(params[:password])
      end
=end
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      session[:user_type] = authorized_user.user_type
      flash[:notice] = 'You are now logged in'
      $current_user = authorized_user.username
      $current_user_type = authorized_user.user_type
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid username/password combination"
      redirect_to(:action => 'login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    session[:user_type] = nil
    session.destroy
    flash[:notice] = "Logged out"
    redirect_to(:action => 'login')
  end
end

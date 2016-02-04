class UsersController < ApplicationController
  before_action :confirm_logged_in
  before_action :is_member_user? , :except => [:edit_profile, :users_history]
  def index
    @user = User.sorted
    @user = User.search(params[:first_name], params[:last_name], params[:email], params[:username],params[:user_type])
    render('index')
  end


  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def edit_profile
    @user = User.find(params[:id])
  end

  def delete
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def users_history
    if is_admin_user?
      user_id = params[:user_id]
    else
      user_id = current_user.id
    end
    @transactions = Transaction.where(user_id: user_id)
    @user = User.find(user_id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Subject Deleted Successfully!"
    redirect_to(:action => 'index')
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :user_type, :username, :password)
  end
end
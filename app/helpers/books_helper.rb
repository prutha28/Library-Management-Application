module BooksHelper

  def transaction_user(userid)
    #@current_user ||= User.find_by(id: session[:user_id])  || Member.find_by(id: session[:user_id])
    #@transaction_user=user.find(params[:user_id])
    @transaction_user = User.find_by(id: userid)
  end

end

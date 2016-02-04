class BooksController < ApplicationController
  before_action :confirm_logged_in #, :is_admin_user? #,:is_member_user?
  before_action :is_member_user?, :except => [:index, :show,:return, :checkout, :book_history, :view_suggestions, :suggest_book, :create, :subscribe]
  before_action :is_admin_user?

  def index
    @books = Book.search(params[:author], params[:title], params[:isbn], params[:status],"Approved")
    render('index')
  end

  def show
    @book = Book.find(params[:id])
    #if @book.suggestion_status=='Suggested'
    # render index
    #end
  end

  :is_admin_user?
  :is_member_user?
  def new
    @books = Book.new
  end

  def edit
    @books = Book.find(params[:id])
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Subject Deleted Successfully!"
    redirect_to(:action => 'index')
  end

  def create
    @books = Book.new(book_params)

    if @books.save
      flash[:notice] = "Subject Created Successfully!"
      redirect_to @books
    else
      render 'new'
    end
  end

  def update
    @books = Book.find(params[:id])

    if @books.update(book_params)
      flash[:notice] = "Subject Updated Successfully!"
      redirect_to @books
    else
      render 'edit'
    end
  end

  def checkout
    @book = Book.find_by(id: params[:id])
    if is_admin_user?
      @pseudo_users = User.find_by(username: params[:user_name])
      if @pseudo_users != nil
        user_id = @pseudo_users.id
        #@pseudo_users = User.find_by(username: params[:user_name])
        if @book.status == "Available"
          #if is_admin_user?
          @book.update(user_id: user_id, status: "Checked out")
          transaction = Transaction.new(user_id: user_id, book_id: @book.id, order_date: Time.now, transaction_type:"Checkout" )
          transaction.save
          flash[:notice] = "Successfully checked out #{@book.title}!!"
          #   redirect_to boo # book_path and return

        elsif @book.status == "Checked out"
          flash[:notice] = "The book #{@book.title} has already been checked out !!"
          # redirect_to foo #show and return
          redirect_to(:action => 'checkout')
        end
      end
    else
      user_id = current_user.id
      if @book.status == "Available"
        #if is_admin_user?
        @book.update(user_id: user_id, status: "Checked out")
        transaction = Transaction.new(user_id: user_id, book_id: @book.id, order_date: Time.now, transaction_type:"Checkout" )
        transaction.save
        flash[:notice] = "Successfully checked out #{@book.title}!!"
        #   redirect_to boo # book_path and return

      elsif @book.status == "Checked out"
        flash[:notice] = "The book #{@book.title} has already been checked out !!"
        # redirect_to foo #show and return
        redirect_to(:action => 'checkout')
      end
    end
  end

  def return
    @book = Book.find_by(id: params[:id])
    @transactions = Transaction.where("book_id = ?", @book.id).first

    if is_admin_user?
      @pseudo_users = User.find_by(username: params[:user_name])
      if @pseudo_users != nil  # TODO added this if condition to filter out invalid user when admin return book
        user_id = @pseudo_users.id
      end
    else
      user_id = current_user.id
    end

    #if @transactions != nil
    if @transactions.user_id == user_id
      transaction = Transaction.new(user_id: current_user.id, book_id: @book.id,
                                    order_date: Time.now, transaction_type:"return" )
      transaction.save
      @book.status = "Available"
      @book.save
      flash[:danger] = "You have successfully returned!"
      notify_subscribers(@book)
    else #if @transactions.user_id != current_user.id #&& !is_admin_user?
      flash[:notice] = "Book is not issued to you, you can't return"
    end
  end

  #notify the subscribers
  def subscribe
    @book = Book.find(params[:id])
    Notifier.create(isbn: params[:isbn], email_id: current_user.email)
  end

  def notify_subscribers(book)
    @book = book
    subscribers = Notifier.where("isbn like ?", book.isbn)
    subscribers.each do |subscriber|
      UserMailer.notify_availability(subscriber, book).deliver_now
    end
  end

  def book_history
    @book = Book.find(params[:book_id])
    @transactions= Transaction.where(book_id: params[:book_id])
  end

  def view_suggestions
    @suggested_books = Book.where(suggestion_status: "Suggested")
  end

  def suggest_book
    @books = Book.new
  end

  def suggestion_result
    @book = Book.find_by(id: params[:id])
    Book.update(@book.id,:suggestion_status=>params[:s_status] )
    @books = Book.find_by(id: params[:id])
  end

  private
  def book_params
    params.require(:books).permit(:title, :author, :status, :isbn, :description, :suggestion_status)
  end

  def user_params
    params.require(:users).permit(:username)
  end
end
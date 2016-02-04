module UsersHelper

  def transaction_book(userid)
    @transaction_book = Book.find_by(id: userid)
  end
end

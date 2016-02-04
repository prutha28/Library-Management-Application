class Transaction < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  def self.fetch( isbn)
    where("isbn like ?", "%#{isbn}%")
  end

  def self.search(user_id)
    where("user_id like ?", "%#{user_id}%")
  end

  def self.fetch_book(book_id)
    where("id like ?", "%#{book_id}%")
  end
end

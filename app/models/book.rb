class Book < ActiveRecord::Base
     belongs_to :user
     has_many :transactions, dependent: :destroy

     validates :author,
               presence: true,
               length: { minimum:1, maximum:30}
     validates :title,
               presence: true,
               length: { minimum:1, maximum:30}
     validates :isbn, uniqueness: { case_sensitive: false },
               presence: true,
               length: { minimum:1, maximum:15}

     serialize :transactions

     def self.search(author, title, isbn, status, suggestion_status)
          where("title like ? AND author like ? AND isbn like ? AND status like ? AND suggestion_status like ?",
                "%#{title}%","%#{author}%", "%#{isbn}%","%#{status}%", "#{suggestion_status}")
     end
end

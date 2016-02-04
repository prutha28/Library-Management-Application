class User < ActiveRecord::Base
  has_secure_password
  has_many :books
  has_many :transactions

  #serialize :transactions

  validates :first_name, presence: true,
            length: { minimum:1, maximum: 30 }
  validates :last_name,
            length: { maximum: 30 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, presence: true, uniqueness: true,length: { minimum:5, maximum: 30 }
  validates :user_type,  presence: true
  scope :sorted, lambda {order("first_name ASC, last_name ASC")}

  def self.search(first_name, last_name, email, username,user_type)
    where("first_name like ? AND last_name like ? AND email like ? AND username like ? AND user_type like ?",
          "%#{first_name}%","%#{last_name}%", "%#{email}%", "%#{username}%", "%#{user_type}%")
  end
end

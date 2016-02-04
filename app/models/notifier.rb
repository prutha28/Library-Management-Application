class Notifier < ActiveRecord::Base
  validates :email_id, uniqueness: {scope: :isbn}
end

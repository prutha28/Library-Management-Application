class CreateNotifiers < ActiveRecord::Migration
  def change
    create_table :notifiers do |t|
      t.string :email_id
      t.string :isbn
      t.timestamps null: false
    end
  end
end

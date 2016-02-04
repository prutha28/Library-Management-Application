class CreateBooks < ActiveRecord::Migration
  def up
    create_table :books do |t|
      t.string :isbn , :null => false
      t.string :title, :default => ""
      t.string :author, :limit => 25
      t.string :status, :default => "Available"
      t.text :description
      t.datetime :order_date
      t.timestamps null: false
    end
  end

  def down
    drop_table :books
  end
end
class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :book, index:true, foreign_key:true
      t.references :user, index:true, foreign_key:true
      t.datetime :order_date
      t.string  :transaction_type
    end
  end
end
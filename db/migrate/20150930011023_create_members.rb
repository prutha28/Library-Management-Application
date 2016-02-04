class CreateMembers < ActiveRecord::Migration
  def up
    create_table :members do |t|
      t.column 'first_name', :string, :limit =>25
      t.string 'last_name', :limit =>50
      t.string 'email', :default =>'', :null =>false
      t.string 'username', :null =>false,:limit => 25
      t.string 'hashed_password', :limit=>40
      t.string 'user_type', :null =>false

      t.timestamps null: false
    end
  end

  def down
    drop_table :members
  end
end

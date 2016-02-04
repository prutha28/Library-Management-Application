class AddPasswordDigestToMembers < ActiveRecord::Migration
  def up
    remove_column "members","hashed_password"
    add_column "members","password_digest", :string
  end
  def down
    add_column "members","hashed_password", :string ,:limit => 40
    remove_column "members","password_digest"
  end
end
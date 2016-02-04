class CreateDefaultUser < ActiveRecord::Migration

  def self.up
 #   user = User.create!( :email => '...', :login => 'root', :password => '...' )
    user = User.create(:first_name => "admin", :last_name => "admin", :email => "admin@sample.com", :username => "admin", :user_type => "admin", :password => "admin", :password_confirmation => "admin")
  end

  def self.down
    user = User.find_by_email( 'admin@sample.com' )
    user.destroy
  end
end

#u = User.create(:first_name => "admin", :last_name => "admin", :email => "admin@sample.com", :username => "admin", :user_type => "admin", :password => "admin", :password_confirmation => "admin")
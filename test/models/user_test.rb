require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "user should be valid" do
      user = User.new(:first_name => "testUser", :last_name => "test_lastname", :email => "test@gmail.com", :username => "test_name", :user_type => "admin", :password => "test1")
    assert user.save
  end

    
test "validation checks should fail" do
  # # No name
  # user = User.new(:email => "test@gmail.com", :password=> "test1",:isDeleted=>FALSE,:role => User::IS_MEMBER)
  # assert_not user.valid?
     

    # No email ID
      user = User.new(:first_name => "testUser2", :last_name => "test_lastname2", :username => "test_name2", :user_type => "admin", :password => "test2")
    assert_not user.valid?

    # No password
      user = User.new(:first_name => "testUser3", :last_name => "test_lastname3", :email => "test3@gmail.com", :username => "test_name", :user_type => "admin")
    assert_not user.valid?

    # No user_type
      user = User.new(:first_name => "testUser4", :last_name => "test_lastname4", :email => "test4@gmail.com", :username => "test_name4", :password => "test4")
    assert_not user.valid?
  end

  test "duplicate emailID accounts should not get created" do
      userA = User.new(:first_name => "testUserA", :last_name => "test_lastnameA", :email => "testA@gmail.com", :username => "test_nameA", :user_type => "Member", :password => "testA")
    userA.save
      
    userB = User.new(:first_name => "testUserB", :last_name => "test_lastnameB", :email => "testA@gmail.com", :username => "test_nameA", :user_type => "Member", :password => "testB")
    assert_not userB.save
  end

end
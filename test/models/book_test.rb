require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "book should be valid" do
      book = Book.new(:isbn => "AB112233", :title => "Corman", :author => "Corman_author", :status => "Available", :description => "xyz", :created_at => "2015-10-08 01:17:38", :updated_at => "2015-10-08 01:17:38", :user_id => "3")
    assert book.save
  end

    
test "validation checks should fail" do
  # # No name
  # book = Book.new(:email => "test@gmail.com", :password=> "test1",:isDeleted=>FALSE,:role => Book::IS_MEMBER)
  # assert_not book.valid?
     

    # No isbn
      book = Book.new(:title => "Corman", :author => "Corman_author", :status => "Available", :description => "xyz", :created_at => "2015-10-08 01:17:38", :updated_at => "2015-10-08 01:17:38", :user_id => "3")
    assert_not book.valid?

=begin
    # No password
      book = Book.new(:first_name => "testBook3", :last_name => "test_lastname3", :email => "test3@gmail.com", :username => "test_name", :user_type => "admin")
    assert_not book.valid?

    # No user_type
      book = Book.new(:first_name => "testBook4", :last_name => "test_lastname4", :email => "test4@gmail.com", :username => "test_name4", :password => "test4")
    assert_not book.valid?
=end
  end

  test "duplicate isbns in books should not get created" do
      book = Book.new(:isbn=> "FF123", :title => "Corman1", :author => "Corman_author1", :status => "Available", :description => "xyz", :created_at => "2015-10-01 01:17:38", :updated_at => "2015-10-04 01:17:38", :user_id => "3")
      
      book = Book.new(:isbn=> "FF123", :title => "Corman2", :author => "Corman_author2", :status => "Available", :description => "xyz", :created_at => "2015-10-02 01:17:38", :updated_at => "2015-10-05 01:17:38", :user_id => "3")
  end

end
class UserMailer < ApplicationMailer
  #default from: 'no_reply_lib@libapp.edu'
  default from: 'eesha.dixit.28@gmail.com'

  def notify_availability(subscriber, book )
    #@url  = 'http://example.com/login'
    @subscriber = subscriber
    @book = book
    mail(to: subscriber, subject: "Book Availability for #{book.title}")
  end
end

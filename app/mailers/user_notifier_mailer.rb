class UserNotifierMailer < ApplicationMailer


  def send_signup_email(message)
    # puts "====================================================="
    @message = message
    # puts @message["url"]
 
    mail( :to => @message["email"],
    :subject => 'The article you requested from your mirror' )
  end



end

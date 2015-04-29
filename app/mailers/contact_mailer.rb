class ContactMailer < ActionMailer::Base

  def contact_email(email)
    @name = email[:name]
    @email_address = @user.email
    @message = email[:message]
    mail(to: 'dilloncortez@gmail.com', subject: "EZ-beats:" + email[:subject])
  end
end

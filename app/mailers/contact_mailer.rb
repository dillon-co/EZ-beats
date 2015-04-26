class ContactMailer < ApplicationMailer

  def contact_email(email)
    @name = email[:name]
    @email_address = @user.email
    @message = email[:message]
    mail(to: 'ezbeatsteam@gmail.com', subject: "EZ-beats:" + email[:subject])
  end
end

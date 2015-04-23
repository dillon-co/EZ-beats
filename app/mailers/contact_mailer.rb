class ContactMailer < ApplicationMailer
  def contact_email(user)
   @user = user
   mail(to: @user.email, subject: 'Sample Email')
 end
end

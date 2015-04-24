class InfopagesController < ApplicationController
  def aboutus
  end

  def email
    email = params[:email]
    if((email[:name] != "") && (email[:subject] != "") && (email[:email] != "") && (email[:message] != ""))
      UserMailer.contact_email(@user).deliver
      redirect_to '/infopages/contact', notice: "Message Sent"
    else
      redirect_to '/infopages/contact', notice: "All Fields Must Be Complete"
    end
  end

  def contact
  end
  
end

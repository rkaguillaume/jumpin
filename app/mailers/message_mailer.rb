class MessageMailer < ApplicationMailer
  def contact_me(message)
    @user_email = message.email
    @like = message.like
    @body = message.body
    @frequencies = message.frequencies
    @recommendation = message.recommendation

    mail to: "guillaumeroche24@gmail.com", from: message.email, subject: "New review"
  end
end

class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params

    if @message.valid?
      email = MessageMailer.contact_me(@message)
      email.deliver_now
      redirect_to new_message_url, notice: "Message received, thanks!"
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:email, :like, :body, :frequencies, :recommendation)
  end
end

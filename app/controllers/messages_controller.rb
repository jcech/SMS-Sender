class MessagesController < ApplicationController

  def index
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    params[:message][:number].each do |key, number|
      curr_contact = Contact.find_by(number: number)

      if !curr_contact.number.empty?
        @message.recipients << Recipient.create(contact_id: curr_contact.id)
      else
        @message.recipients << Recipient.create(
                               contact_id: Contact.create(name: "unset", number: number).id)
      end
    end

    @message.text_it

    redirect_to message_path(@message)
  end

private
  def message_params
    # params.permit(:body, :number, :user_id)
    {body: params[:message][:body], user_id: params[:message][:user_id]}
  end
end

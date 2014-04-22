class MessagesController < ApplicationController

  def index
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    @message.save
  end

private
  def message_params
    params.require(:message).permit(:body, :number)
  end
end

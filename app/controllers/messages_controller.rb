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

    if @message.text_it
      @message.save
      redirect_to message_path(@message)
    else
      redirect_to message_path(@message)
    end
  end

private
  def message_params
    params.require(:message).permit(:body, :number, :user_id)
  end
end

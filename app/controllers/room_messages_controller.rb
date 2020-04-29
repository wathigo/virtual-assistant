class RoomMessagesController < ApplicationController
  def new
    @room_message = RoomMessage.new
  end

  def create
    @room_message = RoomMessage.new(msg_params)
    if @room_message.save
      flash[:alert] = "Message sent"
    else
      flash[:alert] = "Message not sent"
    end
    end

  private

  def msg_params
    params.require(:room_message).permit(:message, :room_id)
  end
end

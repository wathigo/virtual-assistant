class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find_by_id(params[:id])
    @room_messages = @room.room_messages.all
  end

  def create
    @room_message = RoomMessage.new(msg_params)
    @room_message.admin = true
    flash[:alert] = if @room_message.save
                      'Message sent'
                    else
                      'M essage not sent'
                    end
  end

  private
  def msg_params
    params.require(:room_message).permit(:message, :room_id)
  end 
end

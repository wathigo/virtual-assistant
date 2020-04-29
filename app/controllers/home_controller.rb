class HomeController < ApplicationController 
  before_action :create_room, only: [:index]
  def index
    @categories = Category.all
  end

  private
  def create_room
    @room = Room.create(name: Faker::Name.name)
    @room_message = RoomMessage.new room: @room
    @room_messages = @room.room_messages.all
  end
end

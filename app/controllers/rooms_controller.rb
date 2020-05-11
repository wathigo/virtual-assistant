class RoomsController < ApplicationController
    def index
        @rooms = Room.all
    end 

    def show
        @room = Room.find_by_id(params[:id])
        @room_messages = @room.room_messages.all
    end
end

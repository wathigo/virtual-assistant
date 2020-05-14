module RoomsHelper
    def messages?(room)
        room.room_messages.any?
    end

    def message_count(room)
        room.room_messages.count
    end
end

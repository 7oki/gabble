module MessageRoomsHelper
  #メッセージのルームID
  def message_room_id(first_user, second_user)
    first_id = first_user.id.to_i
    second_id = second_user.id.to_i
    if first_id < second_id
     "#{first_user.id}-#{second_user.id}"
    else
    "#{second_user.id}-#{first_user.id}"
    end
  end
end

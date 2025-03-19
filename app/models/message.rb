class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  after_create_commit :broadcast_message


  private

  def broadcast_message
    broadcast_append_to "chatrooms_#{chatroom.id}_messages",
                        partial: "messages/message",
                        locals: { message: self, user: user },
                        target: "messages"
  end
end

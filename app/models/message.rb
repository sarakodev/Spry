class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  after_create_commit :broadcast_message

  
  private

  def broadcast_message
    broadcast_append_to "chatrooms_#{chatroom.id}",
                        partial: "messages/message",
                        target: "messages",
                        locals: { message: self }
  end
end

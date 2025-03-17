class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.where(first_user: current_user).or(Chatroom.where(second_user: current_user))
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end

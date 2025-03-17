class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.append(:messages, partial: "messages/message",
              target: "messages",
              locals: { message: @message })
          end
          format.html { redirect_to chatroom_path(@chatroom) }
        end
      else
        render "bookings/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

class MessagesController < ApplicationController
    before_action :authenticate_user!

    def create
        @current_user_id = current_user.id
        @message = Message.new(message_params)
        @message.user_id = @current_user_id
        if @message.save
            ActionCable.server.broadcast "chatroom_channel", mod_message: message_render(@message)
        end
    end

    private

    def message_params
        params.require(:message).permit(:message_body, :user_id, :image)
    end

    def message_render(message)
        render(partial: 'message', locals: {message: message})
    end
end

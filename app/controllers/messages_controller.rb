class MessagesController < ApplicationController
    before_action :authenticate_user!

    def create
        @current_user_id = current_user.id
        @message = Message.new(message_params)
        @message.user_id = @current_user_id
        @message.save
    end

    private

    def message_params
        params.require(:message).permit(:message_body, :user_id)
    end
end

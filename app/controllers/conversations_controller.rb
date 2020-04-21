class ConversationsController < ApplicationController
  def inbox
    @conversations = Conversation.get_my_conversation(current_user.id)
  end
end

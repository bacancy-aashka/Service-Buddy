class ConversationsController < ApplicationController
  
  before_action :authenticate_user!
  
  def inbox
    @conversations = Conversation.get_my_conversation(current_user.id)
  end
end

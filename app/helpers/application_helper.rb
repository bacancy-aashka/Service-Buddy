module ApplicationHelper
  def navbar_inbox_count
    conversations = Conversation.get_my_conversation(current_user.id)
    @count = Message.distinct(:conversation_id).where(conversation_id: conversations.ids).where(read_at: nil).where.not(user_id: current_user).select("conversation_id").count(:conversation_id)
  end

end

module ConversationsHelper
  def new_message_count(conversation_id)
    @count = Message.where(conversation_id: conversation_id).where(read_at: nil).where.not(user_id: current_user).count(:id)
  end
end

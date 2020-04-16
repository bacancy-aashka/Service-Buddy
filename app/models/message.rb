class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  # VALIDATION :
  validates :body, presence: true

  after_create_commit { MessageBroadcastJob.perform_later(self) }
  after_create_commit :read_previous

  def read_previous
    messages = Message.where(conversation_id: self.conversation_id).where(read_at: nil).where.not(user_id: self.user_id)
    messages.each do |message|
      message.read_at = DateTime.now
      message.save!
    end
  end
end

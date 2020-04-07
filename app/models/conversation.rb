class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :sender, foreign_key: :sender_id, :class_name => 'User'
  belongs_to :recipient, foreign_key: :recipient_id, :class_name => 'User'

  validates :sender_id, uniqueness: { scope: :recipient_id }

  scope :between, -> (sender_id, recipient_id) do
    where(sender_id: sender_id, recipient_id: recipient_id).or(
      where(sender_id: recipient_id, recipient_id: sender_id)
    )
  end

  scope :mycon, -> (my_id) do
    where(sender_id: my_id).or(
      where(recipient_id: my_id)
    )
  end

  def self.get_my_conversation(my_id)
    conversations = mycon(my_id)
    return conversations  
  end

  def self.get(sender_id, recipient_id)
    conversation = between(sender_id, recipient_id).first
    return conversation if conversation.present?

    create(sender_id: sender_id, recipient_id: recipient_id)
  end

  def self.read_message(conversation_id, user_id)
    messages = Message.where(conversation_id: conversation_id).where(read_at: nil).where.not(user_id: user_id)
    messages.each do |message|
      message.read_at = DateTime.now
      message.save!
    end
  end

  def opposed_user(user)
    user == recipient ? sender : recipient
  end
end

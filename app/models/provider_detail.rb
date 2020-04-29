class ProviderDetail < ApplicationRecord

  belongs_to :provider
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  has_many :favourite_posts, dependent: :destroy
  has_many :users, through: :favourite_posts

  # VALIDATION :
  validates :city, :state, presence: true
  validates :description, length: {minimum: 60}
  validates :zipcode, numericality: true
  validates_uniqueness_of :category_id, scope: [:provider_id]

  scope :searching, ->(s) { ProviderDetail.joins(:category).where('provider_details.city LIKE ? OR provider_details.state LIKE ? OR provider_details.zipcode LIKE ? OR categories.name LIKE ? AND provider_details.email_confirmed = ? ', "%#{s}%", "%#{s}%", "%#{s}%", "%#{s}%", false) }

  # after_create_commit {
  #   ProviderDetailBroadcastJob.perform_later(self)
  # }

  # after_update_commit {
  #   if self.email_confirmed
  #     ProviderDetailBroadcastJob.perform_later(self)
  #   end
  # }

  def self.set_confirmation_token(provider_detail)
    if provider_detail.confirm_token.blank?
      provider_detail.confirm_token = SecureRandom.urlsafe_base64.to_s
      provider_detail.save
    end
  end

  def self.validate_email(provider_detail)
    provider_detail.update(email_confirmed: true, confirm_token: nil)
  end

end

class ProviderDetail < ApplicationRecord
  belongs_to :provider
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  # VALIDATION :
  validates :city, :state, presence: true
  # validates :description, length: {minimum: 60}
  validates :zipcode, numericality: true
  validates_uniqueness_of :category_id, scope: [:provider_id]


  # after_create_commit {
  #   ProviderDetailBroadcastJob.perform_later(self)
  # }

  after_update_commit {
    if self.email_confirmed
      ProviderDetailBroadcastJob.perform_later(self)
    end
  }

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

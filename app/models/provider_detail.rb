class ProviderDetail < ApplicationRecord
  belongs_to :provider
  belongs_to :category
  has_many :comments, dependent: :destroy

  has_one_attached :image, dependent: :destroy

  after_create_commit {
    ProviderDetailBroadcastJob.perform_later(self)
  }

  after_update_commit {
    ProviderDetailBroadcastJob.perform_later(self)
  }

end

class ProviderDetail < ApplicationRecord
  belongs_to :provider
  belongs_to :category
  has_one_attached :image
end

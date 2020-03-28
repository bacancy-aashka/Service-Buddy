class ProviderDetail < ApplicationRecord
  belongs_to :provider, dependent: :destroy
  belongs_to :category
end

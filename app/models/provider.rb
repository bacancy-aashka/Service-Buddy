class Provider < ApplicationRecord
  belongs_to :user
  has_one :provider_detail, dependent: :destroy
end

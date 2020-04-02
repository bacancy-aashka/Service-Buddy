class Provider < ApplicationRecord
  belongs_to :user
  has_many :provider_details, dependent: :destroy
  has_many :comments, dependent: :destroy
end

class Provider < ApplicationRecord
  belongs_to :user
  has_many :provider_details, dependent: :destroy
  has_many :work_lists
end

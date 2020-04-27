class Category < ApplicationRecord
  has_many :provider_details, dependent: :destroy
  has_many :work_lists, dependent: :destroy

  # VALIDATION :
  validates :name, presence: true, uniqueness: { case_sensitive: false }

end

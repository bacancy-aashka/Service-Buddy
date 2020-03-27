class Category < ApplicationRecord
  has_many :provider_details, dependent: :destroy

  #VALIDATION
  # validates :name, presence: true, uniqueness: { case_sensitive: false }

end

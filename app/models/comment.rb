class Comment < ApplicationRecord
  
  belongs_to :provider_detail
  belongs_to :user
  has_many :likes, dependent: :destroy

  # VALIDATION :
  validates :body, length: { maximum: 150, minimum: 1, message: 'must be present.' }

  def self.get_average
    (self.average(:rating)) != nil ? (self.average(:rating)).round(1) : 0
  end

end

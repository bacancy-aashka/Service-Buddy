class Comment < ApplicationRecord
  belongs_to :provider_detail
  belongs_to :user

  def self.get_average
    (self.average(:rating)) != nil ? (self.average(:rating)).round(1) : 0
  end
end

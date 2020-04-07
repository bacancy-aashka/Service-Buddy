class Comment < ApplicationRecord
  belongs_to :provider_detail
  belongs_to :user
end

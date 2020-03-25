class Request < ApplicationRecord
  belongs_to :skill
  belongs_to :user
  belongs_to :provider
end

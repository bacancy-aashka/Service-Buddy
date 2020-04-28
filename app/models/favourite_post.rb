class FavouritePost < ApplicationRecord
    belongs_to :user
    belongs_to :provider_detail
end

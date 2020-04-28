class CreateFavouritePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :favourite_posts do |t|
      t.belongs_to :user, index: true
      t.belongs_to :provider_detail, index:true

      t.timestamps
    end
  end
end

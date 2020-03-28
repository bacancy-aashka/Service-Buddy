class ChangesRelatedToProviderDetails < ActiveRecord::Migration[6.0]
  def change
    remove_column :provider_details, :location
    remove_reference :provider_details, :user, index: true, foreign_key: true
    add_reference :providers, :user, null: true, foreign_key: true
    add_reference :provider_details, :provider, null: true, foreign_key: true
    add_reference :provider_details, :category, null: true, foreign_key: true
  end
end

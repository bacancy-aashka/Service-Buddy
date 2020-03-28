class AddDescriptionInProviderDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :provider_details, :description, :text
  end
end

class ChangesInSchema < ActiveRecord::Migration[6.0]
  def change
    rename_table :addresses, :provider_details
    remove_column :providers, :city
  end
end

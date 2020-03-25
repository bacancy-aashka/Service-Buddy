class ChangeTypeOfContactInUser < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :contact, :string
  end
end

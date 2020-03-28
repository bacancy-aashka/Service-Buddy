class ChangeTypeOfContactInUser < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :contact, :string
    change_column :addresses, :zipcode, :string
  end

  def down 
    change_column :users, :contact, :integer
    change_column :addresses, :zipcode, :integer
  end
end

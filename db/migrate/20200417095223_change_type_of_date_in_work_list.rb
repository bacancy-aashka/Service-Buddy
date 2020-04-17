class ChangeTypeOfDateInWorkList < ActiveRecord::Migration[6.0]
  def up
    change_column :work_lists, :date, :date
  end

  def down 
    change_column :work_lists, :date, :datetime
  end
end

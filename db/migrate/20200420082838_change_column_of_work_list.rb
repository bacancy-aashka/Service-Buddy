class ChangeColumnOfWorkList < ActiveRecord::Migration[6.0]
  def change
    change_column :work_lists, :status, :boolean, default: false
  end
end

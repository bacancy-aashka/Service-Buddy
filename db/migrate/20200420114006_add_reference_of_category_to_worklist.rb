class AddReferenceOfCategoryToWorklist < ActiveRecord::Migration[6.0]
  def change
    add_reference :work_lists, :category, foreign_key: true
  end
end

class RemoveTypeFromSorts < ActiveRecord::Migration
  def change
    remove_column :sorts, :type, :string
  end
end

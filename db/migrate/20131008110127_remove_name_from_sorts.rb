class RemoveNameFromSorts < ActiveRecord::Migration
  def change
    remove_column :sorts, :name, :string
  end
end

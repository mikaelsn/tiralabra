class RemoveInputFromSorts < ActiveRecord::Migration
  def change
    remove_column :sorts, :input, :integer
  end
end

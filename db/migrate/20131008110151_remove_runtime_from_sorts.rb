class RemoveRuntimeFromSorts < ActiveRecord::Migration
  def change
    remove_column :sorts, :runtime, :time
  end
end

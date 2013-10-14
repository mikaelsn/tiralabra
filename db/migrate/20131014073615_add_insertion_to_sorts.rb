class AddInsertionToSorts < ActiveRecord::Migration
  def change
    add_column :sorts, :insertion, :float
  end
end

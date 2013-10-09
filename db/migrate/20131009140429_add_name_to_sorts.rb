class AddNameToSorts < ActiveRecord::Migration
  def change
    add_column :sorts, :name, :string
  end
end

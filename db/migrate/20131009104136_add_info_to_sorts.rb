class AddInfoToSorts < ActiveRecord::Migration
  def change
    add_column :sorts, :type, :string
    add_column :sorts, :input, :integer
  end
end

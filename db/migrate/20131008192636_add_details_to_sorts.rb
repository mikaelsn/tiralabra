class AddDetailsToSorts < ActiveRecord::Migration
  def change
    add_column :sorts, :bubble, :float
    add_column :sorts, :quick, :float
    add_column :sorts, :merge, :float
  end
end

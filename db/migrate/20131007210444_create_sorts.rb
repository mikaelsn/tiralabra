class CreateSorts < ActiveRecord::Migration
  def change
    create_table :sorts do |t|
      t.string :name
      t.time :runtime
      t.integer :input

      t.timestamps
    end
  end
end

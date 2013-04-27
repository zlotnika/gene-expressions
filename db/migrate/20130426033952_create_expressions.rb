class CreateExpressions < ActiveRecord::Migration
  def change
    create_table :expressions do |t|
      t.float :mean
      t.float :standard_deviation
      t.references :chip
      t.references :tissue

      t.timestamps
    end
    add_index :expressions, :chip_id
    add_index :expressions, :tissue_id
  end
end

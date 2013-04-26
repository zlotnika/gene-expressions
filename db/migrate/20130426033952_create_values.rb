class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.float :mean
      t.float :standard_deviation
      t.references :chip
      t.references :tissue

      t.timestamps
    end
    add_index :values, :chip_id
    add_index :values, :tissue_id
  end
end

class CreateChips < ActiveRecord::Migration
  def change
    create_table :chips do |t|
      t.string :chip_id
      t.references :gene

      t.timestamps
    end
    add_index :chips, :gene_id
  end
end

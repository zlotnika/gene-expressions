class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :descriptor
      t.references :gene

      t.timestamps
    end
    add_index :tags, :gene_id
  end
end

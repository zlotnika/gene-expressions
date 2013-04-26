class CreateGenes < ActiveRecord::Migration
  def change
    create_table :genes do |t|
      t.string :symbol

      t.timestamps
    end
  end
end

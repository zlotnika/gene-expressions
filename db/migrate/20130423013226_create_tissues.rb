class CreateTissues < ActiveRecord::Migration
  def change
    create_table :tissues do |t|
      t.string :name
      t.integer :total

      t.timestamps
    end
  end
end

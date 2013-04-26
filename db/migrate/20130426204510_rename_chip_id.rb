class RenameChipId < ActiveRecord::Migration
  def up
    rename_column :chips, :chip_id, :name
  end

  def down
    rename_column :chips, :name, :chip_id
  end
end

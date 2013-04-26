class RenameChipId < ActiveRecord::Migration
  def change
    rename_column :chips, :chip_id, :name
  end

end

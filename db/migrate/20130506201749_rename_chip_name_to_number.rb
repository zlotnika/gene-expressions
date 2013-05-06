class RenameChipNameToNumber < ActiveRecord::Migration

  def change
    rename_column :chips, :name, :number
  end

end

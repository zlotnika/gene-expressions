class RenameChipsToProbesets < ActiveRecord::Migration
  
  def change
    rename_table :chips, :probesets
  end
end

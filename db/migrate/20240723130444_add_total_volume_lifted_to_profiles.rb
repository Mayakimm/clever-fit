class AddTotalVolumeLiftedToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :total_volume_lifted, :float
  end
end

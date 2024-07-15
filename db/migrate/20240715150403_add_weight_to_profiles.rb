class AddWeightToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :weight, :float
  end
end

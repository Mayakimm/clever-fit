class AddHeightToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :height, :float
  end
end

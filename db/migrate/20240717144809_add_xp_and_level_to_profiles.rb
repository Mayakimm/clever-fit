class AddXpAndLevelToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :experience_points, :integer
    add_column :profiles, :level, :integer
  end
end

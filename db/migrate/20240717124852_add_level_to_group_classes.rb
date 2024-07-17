class AddLevelToGroupClasses < ActiveRecord::Migration[7.1]
  def change
    add_column :group_classes, :level, :string
  end
end

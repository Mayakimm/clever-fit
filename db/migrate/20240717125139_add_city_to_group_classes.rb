class AddCityToGroupClasses < ActiveRecord::Migration[7.1]
  def change
    add_column :group_classes, :city, :string
  end
end

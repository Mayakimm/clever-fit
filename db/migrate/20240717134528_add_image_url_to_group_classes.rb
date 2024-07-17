class AddImageUrlToGroupClasses < ActiveRecord::Migration[7.1]
  def change
    add_column :group_classes, :image_url, :string
  end
end

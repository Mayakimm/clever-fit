class CreateGroupClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :group_classes do |t|
      t.string :name
      t.string :address
      t.date :date
      t.time :time
      t.integer :limit_of_students
      t.text :description
      t.string :contact
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

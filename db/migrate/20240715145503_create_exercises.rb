class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :video_url
      t.text :description
      t.text :instruction
      t.string :equipment
      t.string :muscle_group
      t.float :met_value

      t.timestamps
    end
  end
end

class CreateUserAchievements < ActiveRecord::Migration[7.1]
  def change
    create_table :user_achievements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :achievement, null: false, foreign_key: true
      t.datetime :achieved_at

      t.timestamps
    end
  end
end

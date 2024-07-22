class CreateDaySummaries < ActiveRecord::Migration[7.1]
  def change
    create_table :day_summaries do |t|
      t.references :profile, null: false, foreign_key: true
      t.date :date
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end

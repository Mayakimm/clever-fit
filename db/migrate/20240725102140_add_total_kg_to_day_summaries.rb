class AddTotalKgToDaySummaries < ActiveRecord::Migration[7.1]
  def change
    add_column :day_summaries, :kg, :float
  end
end

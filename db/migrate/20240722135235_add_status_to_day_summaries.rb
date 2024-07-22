class AddStatusToDaySummaries < ActiveRecord::Migration[7.1]
  def change
    add_column :day_summaries, :status, :string
  end
end

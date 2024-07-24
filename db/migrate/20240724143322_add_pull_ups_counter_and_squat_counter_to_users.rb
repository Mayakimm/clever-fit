class AddPullUpsCounterAndSquatCounterToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :pullups_counter, :integer, default: 0
    add_column :users, :squats_counter, :integer, default: 0
  end
end
